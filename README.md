# terraform-aws-config

This module sets up AWS Config for an account.

It uses the Config rules specified by AWS. These may be found here https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html

This module only supports AWS Managed rules. If you want to add your own rule, add it outside of the module.

NOTE - CURRENTLY THE SPECIFICATION OF SCOPES FOR RULES IS DISABLED DUE TO A BUG IN THE AWS PROVIDER. THIS WILL BE REENABLED ONCE THE BUG IS ADDRESSED.

## Authors

Module managed by Quinovas (https://github.com/QuiNovas)

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/). See LICENSE for full details.