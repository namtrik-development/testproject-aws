from storages.backends.s3boto3 import S3Boto3Storage

class MediaStorage(S3Boto3Storage):
  location = 'uploads'

class StaticStorage(S3Boto3Storage):
  querystring_auth = False
  location = 'statics'
