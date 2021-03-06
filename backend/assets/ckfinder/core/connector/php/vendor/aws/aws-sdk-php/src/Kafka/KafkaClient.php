<?php
namespace Aws\Kafka;

use Aws\AwsClient;

/**
 * This client is used to interact with the **Managed Streaming for Kafka** service.
 * @method \Aws\Result createCluster(array $args = [])
 * @method \GuzzleHttp\Promise\Promise createClusterAsync(array $args = [])
 * @method \Aws\Result createConfiguration(array $args = [])
 * @method \GuzzleHttp\Promise\Promise createConfigurationAsync(array $args = [])
 * @method \Aws\Result deleteCluster(array $args = [])
 * @method \GuzzleHttp\Promise\Promise deleteClusterAsync(array $args = [])
 * @method \Aws\Result describeCluster(array $args = [])
 * @method \GuzzleHttp\Promise\Promise describeClusterAsync(array $args = [])
 * @method \Aws\Result describeClusterOperation(array $args = [])
 * @method \GuzzleHttp\Promise\Promise describeClusterOperationAsync(array $args = [])
 * @method \Aws\Result describeConfiguration(array $args = [])
 * @method \GuzzleHttp\Promise\Promise describeConfigurationAsync(array $args = [])
 * @method \Aws\Result describeConfigurationRevision(array $args = [])
 * @method \GuzzleHttp\Promise\Promise describeConfigurationRevisionAsync(array $args = [])
 * @method \Aws\Result getBootstrapBrokers(array $args = [])
 * @method \GuzzleHttp\Promise\Promise getBootstrapBrokersAsync(array $args = [])
 * @method \Aws\Result listClusterOperations(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listClusterOperationsAsync(array $args = [])
 * @method \Aws\Result listClusters(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listClustersAsync(array $args = [])
 * @method \Aws\Result listConfigurationRevisions(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listConfigurationRevisionsAsync(array $args = [])
 * @method \Aws\Result listConfigurations(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listConfigurationsAsync(array $args = [])
 * @method \Aws\Result listNodes(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listNodesAsync(array $args = [])
 * @method \Aws\Result listTagsForResource(array $args = [])
 * @method \GuzzleHttp\Promise\Promise listTagsForResourceAsync(array $args = [])
 * @method \Aws\Result tagResource(array $args = [])
 * @method \GuzzleHttp\Promise\Promise tagResourceAsync(array $args = [])
 * @method \Aws\Result untagResource(array $args = [])
 * @method \GuzzleHttp\Promise\Promise untagResourceAsync(array $args = [])
 * @method \Aws\Result updateBrokerStorage(array $args = [])
 * @method \GuzzleHttp\Promise\Promise updateBrokerStorageAsync(array $args = [])
 * @method \Aws\Result updateClusterConfiguration(array $args = [])
 * @method \GuzzleHttp\Promise\Promise updateClusterConfigurationAsync(array $args = [])
 */
class KafkaClient extends AwsClient {}
