<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS Api Gateway
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create Route53 resource on AWS for create api gateway with it's basic elements.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v0.15-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-aws-api-gateway'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AWS+Api+Gateway&url=https://github.com/clouddrove/terraform-aws-api-gateway'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AWS+Api+Gateway&url=https://github.com/clouddrove/terraform-aws-api-gateway'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 

- [Terraform 0.15](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-aws-api-gateway/releases).


Here are examples of how you can use this module in your inventory structure:
### Basic Example
```hcl
  module "api-gateway" {
    source        = "clouddrove/api-gateway/aws"
    version       = "0.15.0"
    name          = "api-gateway"
    environment   = "test"
    label_order   = ["name", "environment"]
    enabled       = true

  # Api Gateway Resource
    path_parts = ["mytestresource", "mytestresource1"]

  # Api Gateway Method
    method_enabled = true
    http_methods   = ["GET", "GET"]

  # Api Gateway Integration
    integration_types        = ["MOCK", "AWS_PROXY"]
    integration_http_methods = ["POST", "POST"]
    uri                      = ["", "arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:xxxxxxxxxx:function:test/invocations"]
    integration_request_parameters = [{
      "integration.request.header.X-Authorization" = "'static'"
    }, {}]
    request_templates = [{
      "application/xml" = <<EOF
  {
     "body" : $input.json('$')
  }
  EOF
    }, {}]

  # Api Gateway Method Response
    status_codes = [200, 200]
    response_models = [{ "application/json" = "Empty" }, {}]
    response_parameters = [{ "method.response.header.X-Some-Header" = true }, {}]

  # Api Gateway Integration Response
    integration_response_parameters = [{ "method.response.header.X-Some-Header" = "integration.response.header.X-Some-Other-Header" }, {}]
    response_templates = [{
      "application/xml" = <<EOF
  #set($inputRoot = $input.path('$'))
  <?xml version="1.0" encoding="UTF-8"?>
  <message>
      $inputRoot.body
  </message>
  EOF
    }, {}]

  # Api Gateway Deployment
    deployment_enabled = true
    stage_name         = "deploy"

  # Api Gateway Stage
    stage_enabled = true
    stage_names   = ["qa", "dev"]
  }
```
### Complete Example
```hcl
  module "api-gateway" {
    source        = "clouddrove/api-gateway/aws"
    version       = "0.14.0"

    name        = "api-gateway"
    environment = "test"
    label_order = ["name", "environment"]
    enabled     = true

  # Api Gateway Resource
    path_parts = ["mytestresource", "mytestresource1"]

  # Api Gateway Method
    method_enabled = true
    http_methods   = ["GET", "GET"]

  # Api Gateway Integration
    integration_types        = ["MOCK", "AWS_PROXY"]
    integration_http_methods = ["POST", "POST"]
    uri                      = ["", "arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:xxxxxxxxxx:function:test/invocations"]
    integration_request_parameters = [{
      "integration.request.header.X-Authorization" = "'static'"
    }, {}]
    request_templates = [{
      "application/xml" = <<EOF
  {
     "body" : $input.json('$')
  }
  EOF
    }, {}]

  # Api Gateway Method Response
    status_codes = [200, 200]
    response_models = [{ "application/json" = "Empty" }, {}]
    response_parameters = [{ "method.response.header.X-Some-Header" = true }, {}]

  # Api Gateway Integration Response
    integration_response_parameters = [{ "method.response.header.X-Some-Header" = "integration.response.header.X-Some-Other-Header" }, {}]
    response_templates = [{
      "application/xml" = <<EOF
  #set($inputRoot = $input.path('$'))
  <?xml version="1.0" encoding="UTF-8"?>
  <message>
      $inputRoot.body
  </message>
  EOF
    }, {}]

  # Api Gateway Deployment
    deployment_enabled = true
    stage_name         = "deploy"

  # Api Gateway Stage
    stage_enabled = true
    stage_names   = ["qa", "dev"]

  # Api Gateway Client Certificate
    cert_enabled     = true
    cert_description = "clouddrove"

  # Api Gateway Authorizer
    authorizer_count                = 2
    authorizer_names                = ["test", "test1"]
    authorizer_uri                  = ["arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:xxxxxxxxxx:function:test/invocations", "arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:xxxxxxxxxx:function:test/invocations"]
    authorizer_credentials          = ["arn:aws:iam::xxxxxxxxxx:role/lambda-role", "arn:aws:iam::xxxxxxxxxx:role/lambda-role"]
    identity_sources                = ["method.request.header.Authorization", "method.request.header.Authorization"]
    identity_validation_expressions = ["sfdgfhghrfdsdas", ""]
    authorizer_types                = ["TOKEN", "REQUEST"]

  # Api Gateway Gateway Response
    gateway_response_count = 2
    response_types         = ["UNAUTHORIZED", "RESOURCE_NOT_FOUND"]
    gateway_status_codes   = ["401", "404"]

  # Api Gateway Model
    model_count   = 2
    model_names   = ["test", "test1"]
    content_types = ["application/json", "application/json"]

  # Api Gateway Api Key
    key_count = 2
    key_names = ["test", "test1"]
  }
```






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_key\_requireds | Specify if the method requires an API key. | `list(any)` | `[]` | no |
| api\_key\_source | The source of the API key for requests. Valid values are HEADER (default) and AUTHORIZER. | `string` | `"HEADER"` | no |
| api\_log\_enabled | Whether to enable log for rest api. | `bool` | `false` | no |
| api\_policy | The policy document. | `any` | `null` | no |
| attributes | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| authorization\_scopes | The authorization scopes used when the authorization is COGNITO\_USER\_POOLS. | `list(any)` | `[]` | no |
| authorizations | The type of authorization used for the method (NONE, CUSTOM, AWS\_IAM, COGNITO\_USER\_POOLS). | `list(any)` | `[]` | no |
| authorizer\_count | Number of count to create Authorizers for api. | `number` | `0` | no |
| authorizer\_credentials | The credentials required for the authorizer. To specify an IAM Role for API Gateway to assume, use the IAM Role ARN. | `list(any)` | `[]` | no |
| authorizer\_ids | The authorizer id to be used when the authorization is CUSTOM or COGNITO\_USER\_POOLS. | `list(any)` | `[]` | no |
| authorizer\_names | The name of the authorizer. | `list(any)` | `[]` | no |
| authorizer\_result\_ttl\_in\_seconds | The TTL of cached authorizer results in seconds. Defaults to 300. | `list(any)` | `[]` | no |
| authorizer\_types | The type of the authorizer. Possible values are TOKEN for a Lambda function using a single authorization token submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, or COGNITO\_USER\_POOLS for using an Amazon Cognito user pool. Defaults to TOKEN. | `list(any)` | `[]` | no |
| authorizer\_uri | The authorizer's Uniform Resource Identifier (URI). This must be a well-formed Lambda function URI in the form of arn:aws:apigateway:{region}:lambda:path/{service\_api}, e.g. arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:012345678912:function:my-function/invocations. | `list(any)` | `[]` | no |
| binary\_media\_types | The list of binary media types supported by the RestApi. By default, the RestApi supports only UTF-8-encoded text payloads. | `list(any)` | <pre>[<br>  "UTF-8-encoded"<br>]</pre> | no |
| cache\_cluster\_enableds | Specifies whether a cache cluster is enabled for the stage. | `list(any)` | `[]` | no |
| cache\_cluster\_sizes | The size of the cache cluster for the stage, if enabled. Allowed values include 0.5, 1.6, 6.1, 13.5, 28.4, 58.2, 118 and 237. | `list(any)` | `[]` | no |
| cache\_key\_parameters | A list of cache key parameters for the integration. | `list(any)` | `[]` | no |
| cache\_namespaces | The integration's cache namespace. | `list(any)` | `[]` | no |
| cert\_description | The description of the client certificate. | `string` | `""` | no |
| cert\_enabled | Whether to create client certificate. | `bool` | `false` | no |
| client\_certificate\_ids | The identifier of a client certificate for the stage | `list(any)` | `[]` | no |
| connection\_ids | The id of the VpcLink used for the integration. Required if connection\_type is VPC\_LINK. | `list(any)` | `[]` | no |
| connection\_types | The integration input's connectionType. Valid values are INTERNET (default for connections through the public routable internet), and VPC\_LINK (for private connections between API Gateway and a network load balancer in a VPC). | `list(any)` | `[]` | no |
| content\_handlings | Specifies how to handle request payload content type conversions. Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT. If this property is not defined, the request payload will be passed through from the method request to integration request without modification, provided that the passthroughBehaviors is configured to support payload pass-through. | `list(any)` | `[]` | no |
| content\_types | The content type of the model. | `list(any)` | `[]` | no |
| credentials | The credentials required for the integration. For AWS integrations, 2 options are available. To specify an IAM Role for Amazon API Gateway to assume, use the role's ARN. To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::\*:user/\*. | `list(any)` | `[]` | no |
| deploy\_description | The description of the deployment. | `string` | `""` | no |
| deployment\_enabled | Whether to deploy rest api. | `bool` | `false` | no |
| description | The description of the REST API | `string` | `""` | no |
| descriptions | The description of the stage. | `list(any)` | `[]` | no |
| destination\_arns | ARN of the log group to send the logs to. Automatically removes trailing :\* if present. | `list(any)` | `[]` | no |
| documentation\_versions | The version of the associated API documentation. | `list(any)` | `[]` | no |
| enabled | Whether to create rest api. | `bool` | `false` | no |
| enableds | Specifies whether the API key can be used by callers. Defaults to true. | `list(any)` | `[]` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `"https://registry.terraform.io/modules/clouddrove/api-gateway/aws"` | no |
| formats | The formatting and values recorded in the logs. | `list(any)` | `[]` | no |
| gateway\_response\_count | Number of count to create Gateway Response for api. | `number` | `0` | no |
| gateway\_response\_parameters | A map specifying the templates used to transform the response body. | `list(any)` | `[]` | no |
| gateway\_response\_templates | A map specifying the parameters (paths, query strings and headers) of the Gateway Response. | `list(any)` | `[]` | no |
| gateway\_status\_codes | The HTTP status code of the Gateway Response. | `list(any)` | `[]` | no |
| http\_methods | The HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY). | `list(any)` | `[]` | no |
| identity\_sources | The source of the identity in an incoming request. Defaults to method.request.header.Authorization. For REQUEST type, this may be a comma-separated list of values, including headers, query string parameters and stage variables - e.g. "method.request.header.SomeHeaderName,method.request.querystring.SomeQueryStringName". | `list(any)` | `[]` | no |
| identity\_validation\_expressions | A validation expression for the incoming identity. For TOKEN type, this value should be a regular expression. The incoming token from the client is matched against this expression, and will proceed if the token matches. If the token doesn't match, the client receives a 401 Unauthorized response. | `list(any)` | `[]` | no |
| integration\_http\_methods | The integration HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONs, ANY, PATCH) specifying how API Gateway will interact with the back end. Required if type is AWS, AWS\_PROXY, HTTP or HTTP\_PROXY. Not all methods are compatible with all AWS integrations. e.g. Lambda function can only be invoked via POST. | `list(any)` | `[]` | no |
| integration\_request\_parameters | A map of request query string parameters and headers that should be passed to the backend responder. For example: request\_parameters = { "integration.request.header.X-Some-Other-Header" = "method.request.header.X-Some-Header" }. | `list(any)` | `[]` | no |
| integration\_response\_parameters | A map of response parameters that can be read from the backend response. For example: response\_parameters = { "method.response.header.X-Some-Header" = "integration.response.header.X-Some-Other-Header" }. | `list(any)` | `[]` | no |
| integration\_types | The integration input's type. Valid values are HTTP (for HTTP backends), MOCK (not calling any real backend), AWS (for AWS services), AWS\_PROXY (for Lambda proxy integration) and HTTP\_PROXY (for HTTP proxy integration). An HTTP or HTTP\_PROXY integration with a connection\_type of VPC\_LINK is referred to as a private integration and uses a VpcLink to connect API Gateway to a network load balancer of a VPC. | `list(any)` | `[]` | no |
| key\_count | Number of count to create key for api gateway. | `number` | `0` | no |
| key\_descriptions | The API key description. Defaults to "Managed by Terraform". | `list(any)` | `[]` | no |
| key\_names | The name of the API key. | `list(any)` | `[]` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove'. | `string` | `"hello@clouddrove.com"` | no |
| method\_enabled | Whether to create stage for rest api. | `bool` | `false` | no |
| minimum\_compression\_size | Minimum response size to compress for the REST API. Integer between -1 and 10485760 (10MB). Setting a value greater than -1 will enable compression, -1 disables compression (default). | `number` | `-1` | no |
| model\_count | Number of count to create Model for api. | `number` | `0` | no |
| model\_descriptions | The description of the model. | `list(any)` | `[]` | no |
| model\_names | The name of the model. | `list(any)` | `[]` | no |
| model\_schemas | The schema of the model in a JSON form. | `list` | `[]` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| passthrough\_behaviors | The integration passthrough behavior (WHEN\_NO\_MATCH, WHEN\_NO\_TEMPLATES, NEVER). Required if request\_templates is used. | `list(any)` | `[]` | no |
| path\_parts | The last path segment of this API resource. | `list(any)` | `[]` | no |
| provider\_arns | required for type COGNITO\_USER\_POOLS) A list of the Amazon Cognito user pool ARNs. Each element is of this format: arn:aws:cognito-idp:{region}:{account\_id}:userpool/{user\_pool\_id}. | `list(any)` | `[]` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-api-gateway"` | no |
| request\_models | A map of the API models used for the request's content type where key is the content type (e.g. application/json) and value is either Error, Empty (built-in models) or aws\_api\_gateway\_model's name. | `list(any)` | `[]` | no |
| request\_parameters | A map of request query string parameters and headers that should be passed to the integration. For example: request\_parameters = {"method.request.header.X-Some-Header" = true "method.request.querystring.some-query-param" = true} would define that the header X-Some-Header and the query string some-query-param must be provided in the request. | `list(any)` | `[]` | no |
| request\_templates | A map of the integration's request templates. | `list(any)` | `[]` | no |
| request\_validator\_ids | The ID of a aws\_api\_gateway\_request\_validator. | `list(any)` | `[]` | no |
| response\_content\_handlings | Specifies how to handle request payload content type conversions. Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT. If this property is not defined, the response payload will be passed through from the integration response to the method response without modification. | `list(any)` | `[]` | no |
| response\_models | A map of the API models used for the response's content type. | `list(any)` | `[]` | no |
| response\_parameters | A map of response parameters that can be sent to the caller. For example: response\_parameters = { "method.response.header.X-Some-Header" = true } would define that the header X-Some-Header can be provided on the response. | `list(any)` | `[]` | no |
| response\_templates | A map specifying the templates used to transform the integration response body. | `list(any)` | `[]` | no |
| response\_types | The response type of the associated GatewayResponse. | `list(any)` | `[]` | no |
| schemas | The schema of the model in a JSON form. | `list(any)` | `[]` | no |
| stage\_description | The description of the stage. | `string` | `""` | no |
| stage\_enabled | Whether to create stage for rest api. | `bool` | `false` | no |
| stage\_name | The name of the stage. If the specified stage already exists, it will be updated to point to the new deployment. If the stage does not exist, a new one will be created and point to this deployment. | `string` | `""` | no |
| stage\_names | The name of the stage. | `list(any)` | `[]` | no |
| stage\_variables | A map that defines the stage variables. | `list(any)` | `[]` | no |
| status\_codes | The HTTP status code. | `list(any)` | `[]` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(any)` | `{}` | no |
| target\_arns | The list of network load balancer arns in the VPC targeted by the VPC link. Currently AWS only supports 1 target. | `list(any)` | `[]` | no |
| timeout\_milliseconds | Custom timeout between 50 and 29,000 milliseconds. The default value is 29,000 milliseconds. | `list(any)` | `[]` | no |
| types | Whether to create rest api. | `list(any)` | <pre>[<br>  "EDGE"<br>]</pre> | no |
| uri | The input's URI. Required if type is AWS, AWS\_PROXY, HTTP or HTTP\_PROXY. For HTTP integrations, the URI must be a fully formed, encoded HTTP(S) URL according to the RFC-3986 specification . For AWS integrations, the URI should be of the form arn:aws:apigateway:{region}:{subdomain.service\|service}:{path\|action}/{service\_api}. region, subdomain and service are used to determine the right endpoint. e.g. arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:012345678901:function:my-func/invocations. | `list(any)` | `[]` | no |
| values | The value of the API key. If not specified, it will be automatically generated by AWS on creation. | `list(any)` | `[]` | no |
| variables | A map that defines variables for the stage. | `map(any)` | `{}` | no |
| vpc\_endpoint\_ids | Set of VPC Endpoint identifiers. It is only supported for PRIVATE endpoint type. | `list(string)` | `[]` | no |
| vpc\_link\_count | Number of count to create VPC Link for api. | `number` | `0` | no |
| vpc\_link\_descriptions | The description of the VPC link. | `list(any)` | `[]` | no |
| vpc\_link\_names | The name used to label and identify the VPC link. | `list(any)` | `[]` | no |
| xray\_tracing\_enabled | A mapping of tags to assign to the resource. | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| execution\_arn | The Execution ARN of the REST API. |
| id | The ID of the REST API. |
| tags | A mapping of tags to assign to the resource. |




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-aws-api-gateway/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-aws-api-gateway)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
