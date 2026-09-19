package terraform.iam

deny contains msg if {
    resource := input.resource_changes[_]

    resource.type == "aws_iam_role_policy"

    policy := json.unmarshal(resource.change.after.policy)

    statement := policy.Statement[_]

    statement.Effect == "Allow"
    statement.Action == "*"
    statement.Resource == "*"

    msg := "IAM policy must not allow Action '*' with Resource '*'"
}