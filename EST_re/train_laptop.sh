LABELED_DATA=../data/laptop/laptop_labeled.json
UNLABELED_DATA=../data/laptop/laptop_unlabeled.json
EXP_DATA=../data/laptop/laptop_exp.json
VALID_DATA=../data/laptop/laptop_valid_data.json
TEST_DATA=../data/laptop/laptop_test_data.json
OUTPUT_DIR=./checkpoints/s2s_ft_laptop_checkpoints/
CACHE_DIR=../cache/s2s_ft_package_laptop_cache
CONFIG_FILE=./s2s_ft/config.json

export CUDA_VISIBLE_DEVICES=3
python main.py \
  --labeled_data ${LABELED_DATA} --unlabeled_data ${UNLABELED_DATA} --exp_data ${EXP_DATA} \
  --valid_data ${VALID_DATA} --test_data ${TEST_DATA} --train_from_scratch\
  --num_labels 3 --output_dir ${OUTPUT_DIR} --train_from_scratch \
  --do_lower_case --max_source_seq_length 128 --max_target_seq_length 128 \
  --num_classifier_epochs_per_iters 3 --num_generator_epochs_per_iters 5 \
  --per_gpu_train_batch_size 2 --gradient_accumulation_steps 16 \
  --num_iters 5 --num_selftrain_iters 20 --learning_rate 1e-5 --num_warmup_steps 500 --cache_dir ${CACHE_DIR}