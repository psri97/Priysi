output rolename {
  value       = "${aws_iam_role.ec2_role.name}"
}

output rolearn {
  value       = "${aws_iam_role.ec2_role.arn}"
}

output instanceprofile {
  value       = "${aws_iam_instance_profile.test_profile.name}"
}