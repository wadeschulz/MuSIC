for ((fold = 1; fold <= 5; fold++));
do
    python run_random_forest.py --outprefix /data/output/ \
    --fold $fold \
    --n_jobs 46 \
    --emd_label IF_emd APMS_emd;
done