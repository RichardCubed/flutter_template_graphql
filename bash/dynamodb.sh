
# Create a new DynamoDB table for our events
aws dynamodb create-table \
    --table-name event \
    --attribute-definitions "$(cat ./attribute-definitions.json)" \
    --key-schema "$(cat ./key-schema.json)" \
    --billing-mode PAY_PER_REQUEST

# Create some test data
aws dynamodb batch-write-item \
    --request-items file://seed-data.json



