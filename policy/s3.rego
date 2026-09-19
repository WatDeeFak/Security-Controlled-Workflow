package terraform.s3

deny contains msg if {
    some bucket in input.resource_changes

    bucket.type == "aws_s3_bucket"

    not encryption_configured(bucket.address)

    msg := "S3 bucket must have server-side encryption configured"
}

encryption_configured(bucket_address) if {
    some resource in input.resource_changes

    resource.type == "aws_s3_bucket_server_side_encryption_configuration"

    expected_address := replace(
        bucket_address,
        "aws_s3_bucket",
        "aws_s3_bucket_server_side_encryption_configuration"
    )

    resource.address == expected_address
}