# How to deploy AI models

1. The model configuration files should be available/created under:
    * For dev and non-api: `/codehub/cfg/model`
    * For prod and API: `/codehub/cfg/model/release`
2. Create the model info file, Ref: **[How to create new model info](how_to_create_new_model_info.md)**
2. The model/weight files should be available under: `/aimldl-dat/release`. This should follow the below directory structure
    ```bash
    ├── matterport
    │   └── coco_things
    │       └── 1
    │           └── mask_rcnn
    │               └── weights
    └── vidteq
        ├── bsg
        │   └── 1
        │       └── mask_rcnn
        │           └── weights
        ├── coco_things
        │   └── 1
        │       └── mask_rcnn
        │           └── weights
        ├── hmd
        │   ├── 1
        │   │   └── mask_rcnn
        │   │       └── weights
        │   ├── 2
        │   │   └── mask_rcnn
        │   │       └── weights
        │   ├── 3
        │   │   └── mask_rcnn
        │   │       └── weights
        │   └── 6
        │       └── mask_rcnn
        │           └── weights
        ├── road_asphalt
        │   └── 1
        │       └── mask_rcnn
        │           └── weights
        ├── road_segmentation
        │   └── 1
        │       └── mask_rcnn
        │           └── weights
        ├── tsd
        │   ├── 4
        │   │   └── mask_rcnn
        │   │       └── weights
        │   └── 5
        │       └── mask_rcnn
        │           └── weights
        └── tsdr
            └── 1
                └── mask_rcnn
                    └── weights
    ```
3. Upload/release the models to the database. Used by the AI API port.
    * uploaded logs are generated here for each model: `/aimldl-dat/logs/annon`
      ```bash
      cd /codehub/scripts/annon
      source run_release_modelinfo.sh <annon_db>
      ## Example:
      source run_release_modelinfo.sh oasis
      ```
4. Verify if modelinfo is loaded in the database
    * check the database directly using mongoclient
    * use annon workflow for verification:
      ```bash
      cd /codehub/apps/annon
      python verifydb.py
      ```
    * summary report: `<dbname>_summary-<ddmmyy>_<hhmmss>.json` is generated in command line and also at the annon logs path: `/aimldl-dat/logs/annon`
    * verify that relative path inforation for `modelinfo->weights_path` in the `annon_summary` report matches with the path on the file system at: `/aimldl-dat/release`
5. copy the sample images for quick testing to the path: `/aimldl-dat/samples`
6. Setup the AI API. **Refer**: [apps.www.od.md](apps.www.od.md)