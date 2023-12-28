provider "aws" {
  region = "us-east-1"  # Thay đổi với khu vực mong muốn của bạn
}

resource "aws_lambda_function" "my_lambda_function" {
  filename      = "lambda.zip"
  function_name = "my-lambda-function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "greet_lambda.lambda_handler"
  runtime       = "python3.8"
  environment {
    variables = {
      greeting = var.greeting
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-execution-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name       = "lambda-policy-attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  roles      = [aws_iam_role.lambda_role.name]
}

output "lambda_function_name" {
  value = aws_lambda_function.my_lambda_function.function_name
}