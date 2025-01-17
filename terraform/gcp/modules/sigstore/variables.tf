/**
 * Copyright 2022 The Sigstore Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  type = string
  validation {
    condition     = length(var.project_id) > 0
    error_message = "Must specify project_id variable."
  }
}

variable "region" {
  description = "The region in which to create the VPC network"
  type        = string
}

variable "attestation_bucket" {
  type        = string
  description = "Name of GCS bucket for attestation."
}

variable "tuf_bucket" {
  type        = string
  description = "Name of GCS bucket for TUF root."
}

variable "ca_pool_name" {
  description = "Certificate authority pool name"
  type        = string
  default     = "sigstore"
}

variable "monitoring" {
  description = "Monitoring and alerting"
  type = object({
    enabled                 = bool
    fulcio_url              = string
    rekor_url               = string
    dex_url                 = string
    notification_channel_id = string
  })
  default = {
    enabled                 = false
    fulcio_url              = "fulcio.example.com"
    rekor_url               = "rekor.example.com"
    dex_url                 = "oauth2.example.com"
    notification_channel_id = ""
  }
}

// Optional values that can be overridden or appended to if desired.
variable "cluster_name" {
  description = "The name to give the new Kubernetes cluster."
  type        = string
  default     = "sigstore-staging"
}

variable "cluster_network_tag" {
  type    = string
  default = ""
}

variable "tunnel_accessor_sa" {
  type        = string
  description = "Email of group to give access to the tunnel to"
}

variable "github_repo" {
  description = "Github repo for running Github Actions from."
  type        = string
}
