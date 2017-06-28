import requests
import boto
import configparser
import logging
import numpy as np

Config = configparser.RawConfigParser()
Config.read('./config.cfg')

AWS_ACCESS_KEY_ID = Config.get('AWSSettings', 'AWS_ACCESS_KEY_ID')
AWS_SECRET_ACCESS_KEY = Config.get('AWSSettings', 'AWS_SECRET_ACCESS_KEY')

request_id_list = []

logger = logging.getLogger()
logger.setLevel(logging.INFO)
logging.basicConfig()


def copy_data_between_buckets(source_bucket, destination_bucket, data):

    # connect to the bucket
    conn = boto.connect_s3(AWS_ACCESS_KEY_ID,
                           AWS_SECRET_ACCESS_KEY)
    logger.info('Access granted to bucket')

    data = data[:-1]
    data = data[1:]

    bucket_src = conn.get_bucket(source_bucket)
    bucket_list = bucket_src.list()
    final_destination_bucket = data + '/'

    bucket_dst = conn.get_bucket(destination_bucket)

    for bucket_file in bucket_list:
        file_path = str(bucket_file.key)
        if file_path.startswith(final_destination_bucket):
            bucket_dst.copy_key(bucket_file.key, bucket_src.name, bucket_file.key)


def main():

    if True:
        # modify the bucket accordingly
        source_bucket = ''
        destination_bucket = ''
        # list of orders need to be copied
        filename = './list_of_data.csv'

        data_list = np.genfromtxt(filename, dtype=None, delimiter=',', names=True)

        # Scan S3
        for data in data_list:
            logger.info('Start copying data %s', data)
            copy_data_between_buckets(source_bucket, destination_bucket, (data['data']))
            logger.info('Finish copying data %s', data)


if __name__ == "__main__":

    main()
