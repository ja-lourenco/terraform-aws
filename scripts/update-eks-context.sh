#!/usr/bin/env bash

# -e: Exit immediately if any command fails
# -u: Treat unset variables as an error
# -o pipefail: Catch failures in piped commands
set -euo pipefail

# Ensure the required environment variables passed by Terraform are present
if [[ -z "${CLUSTER_NAME:-}" || -z "${REGION:-}" ]]; then
  echo "❌ Error: Missing required environment variables."
  echo "Ensure CLUSTER_NAME and REGION are set by Terraform."
  exit 1
fi

echo "🔄 Fetching new cluster properties for: $CLUSTER_NAME ($REGION)..."

# Update kubeconfig and force it to use your custom alias
aws eks update-kubeconfig \
  --region "$REGION" \
  --name "$CLUSTER_NAME" \
  --alias "$CLUSTER_NAME"

echo "✅ Kubeconfig updated successfully."

# Switch to the context using your static alias
echo "🔄 Switching kubectl context to: $CLUSTER_NAME..."
kubectl config use-context "$CLUSTER_NAME"

# Verify the cluster connection is ready
echo "🔍 Verifying connection to the cluster..."
kubectl cluster-info

echo "🚀 Ready for usage!"
