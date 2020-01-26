# terraform-aws-state-mgmt-sample-infra

Sample Terraform infrastructure to demonstrate use of https://github.com/saurabh-hirani/terraform-aws-state-mgmt

## Steps

1. Create the state bucket

    ```sh
    cd dev/01-state_mgmt
    make init
    make plan
    make apply
    ```

    The **terraform.state** file is created locally because there is no remote state to
    store the newly created remote state infra.

2. Verify the output

    ```sh
    make output | tail -n +2 | jq '{state_bucket: .tf_bucket_id.value, lock_table: .tf_lock_table_name.value[0]}'
    ```

    should produce output similar to

    ```sh
    {
    "state_bucket": "sample-app-tf-state-bucket",
    "lock_table": "sample-app-tf-lock-table"
    }
    ```

3. The above 2 infra components can now be used as a foundation for rest of the infra.

    ```sh
    cd - && cd app
    cat init.tf
    ```

    should show

    ```sh
    terraform {
        backend "s3" {
            bucket         = "sample-app-tf-state-bucket"
            dynamodb_table = "sample-app-tf-lock-table"
        }
    }

    provider "aws" {
    }
    ```

    This hard coding is required because Terraform does not allow interpolation in ```backend``` block.

4. Export the bucket name (for the app/Makefile) and create the test infra

    ```sh
    export TF_STATE_S3=sample-app-tf-state-bucket
    make init && make plan && make apply
    ```

5. Destroy the infra.

    ```sh
    make destroy
    ```
