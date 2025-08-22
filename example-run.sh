#!/bin/bash

# if running as a job, also pass job ID for identification
JOBID="$PBS_JOBID"

DATADIR="data/processed/ud-inflection/ud-treebanks-v2.14"
PYTHON=".venv/bin/python"

mkdir -p logs/
mkdir -p results/


model="transformer"


########### A TRIAL TO CHECK THAT EVERYTHING RUNS ##############################
expid="exp0-first-experiment"
corpus="UD_Breton-KEB;UD_English-EWT"
e=1

for temp in 0.0 ; do
	for seed in 44 ; do
		$PYTHON inflector.py --seed $seed  --frequency_weighted_training_temperature $temp --eval_also_on_test --eval_also_on_train --checkpoint_selection --acc_for_ckpt_selection "w-accuracy" --weighted_accuracy_during_training --weight_decay 0.01 --clip_grad_norm 1.0 --lr 0.001 --lr_decay "cosine" --batch_size 512 --epochs $e  --joint_vocab --trm_layer_dim 256 --trm_layer_count 3 --trm_attn_heads 4 --trm_ff_nn_dim 64 --trm_drop 0.15 --trm_attn_drop 0.1 --trm_feed_drop 0.35 --trm_layer_drop 0.2 --expid $expid --datadir $DATADIR --jobid $PBS_JOBID --model $model --corpus $corpus || { echo >&2 "Calculation ended up erroneously (with a code $?) !!"; exit 3; }
	done
done


echo "Finished trial run."

################################################################################

# ACTUAL RUN (UNCOMMENT BELOW)

corpus="UD_Afrikaans-AfriBooms;UD_Basque-BDT;UD_Belarusian-HSE;UD_Breton-KEB;UD_Bulgarian-BTB;UD_Catalan-AnCora;UD_Croatian-SET;UD_Czech-PDT;UD_Danish-DDT;UD_Dutch-Alpino;UD_English-EWT;UD_Estonian-EDT;UD_Finnish-TDT;UD_French-GSD;UD_Galician-TreeGal;UD_German-GSD;UD_Gothic-PROIEL;UD_Greek-GDT;UD_Hungarian-Szeged;UD_Icelandic-Modern;UD_Irish-IDT;UD_Italian-ISDT;UD_Latin-ITTB;UD_Latvian-LVTB;UD_Lithuanian-ALKSNIS;UD_Low_Saxon-LSDC;UD_Manx-Cadhan;UD_Norwegian-Bokmaal;UD_Old_French-PROFITEROLE;UD_Polish-PDB;UD_Pomak-Philotis;UD_Portuguese-Bosque;UD_Romanian-RRT;UD_Russian-SynTagRus;UD_Sanskrit-Vedic;UD_Scottish_Gaelic-ARCOSG;UD_Slovak-SNK;UD_Slovenian-SSJ;UD_Spanish-AnCora;UD_Swedish-Talbanken;UD_Turkish-BOUN;UD_Ukrainian-IU;UD_Welsh-CCG"


e=960
expid="exp0-corpus-freqs"

# Different temperature value (tau)
# for temp in -1 -0.8 -0.6 -0.5 -0.4 -0.3 -0.2 -0.1 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.8 1.0 1.1 2.0 ; do
#     # different seeds, average to stabilize the results
# 	for seed in 43 44 45 ; do
# 		$PYTHON inflector.py --seed $seed  --frequency_weighted_training_temperature $temp --eval_also_on_test --eval_also_on_train --checkpoint_selection --acc_for_ckpt_selection "w-accuracy" --weighted_accuracy_during_training --weight_decay 0.01 --clip_grad_norm 1.0 --lr 0.001 --lr_decay "cosine" --batch_size 512 --epochs $e  --joint_vocab --trm_layer_dim 256 --trm_layer_count 3 --trm_attn_heads 4 --trm_ff_nn_dim 64 --trm_drop 0.15 --trm_attn_drop 0.1 --trm_feed_drop 0.35 --trm_layer_drop 0.2 --expid $expid --datadir $DATADIR --jobid $PBS_JOBID --model $model --corpus $corpus || { echo >&2 "Calculation ended up erroneously (with a code $?) !!"; exit 3; }
# 	done
# done
