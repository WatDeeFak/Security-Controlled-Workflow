# Security Requirements

## 1. Security Group

- SSH (TCP/22) must not be exposed to 0.0.0.0/0.
- Administrative access must use a restricted CIDR range.

## 2. IAM

- IAM policies must not allow Action "*" together with Resource "*".
- Permissions should follow the principle of least privilege.

### Example of prohibited policy

```json
{
  "Effect": "Allow",
  "Action": "*",
  "Resource": "*"
}

## 3. S3

- All S3 buckets must have server-side encryption enabled.