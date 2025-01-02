1. Install libgmp and cmake via apt
```
apt install cmake libgmp-dev libmpfr-dev libmpc-dev
```
2. Follow instructions at: https://github.com/idekerlab/MuSIC/wiki/A-Step-By-Step-Guide-to-Building-a-MuSIC-Map
3. Generate calibrated distances
```
python calibrate_pairwise_distance.py --protein_file ./Examples/MuSIC_proteins.txt --outprefix /data/output/
```
4. Build files for RF model for protein-protein proximity prediction
```
python random_forest_samples.py \
--outprefix /data/output/ --protein_file ./Examples/MuSIC_proteins.txt \
--emd_files ./Examples/IF_image_embedding.csv ./Examples/APMS_embedding.MuSIC.csv \
--emd_label IF_emd APMS_emd
```
5. Run training and kfold for RF model
```
./rf_kfold.sh
```
6. Create protein pairwise proximity file from RF outputs
```
python random_forest_output.py --outprefix /data/output/
```
7. Create command for community detection with clixo
```
python community_detection.py --outprefix /data/output/ \
--clixo_i /data/output/predicted_proximity.txt \
--predict_nm_size --keep_all_files
```
