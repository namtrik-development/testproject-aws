from django.db import models

class S3ImageObject(models.Model):
  filename = models.CharField(max_length=256, verbose_name='nombre del archivo')
  image = models.ImageField(upload_to='images', verbose_name='imagen')

  class Meta:
    verbose_name = 'imagen en S3'
    verbose_name_plural = 'imagenes en S3'

  def image_tag(self):
    from django.utils.html import mark_safe
    return mark_safe('<img src="%s" width="150" height="150" />' % (self.image.url))

  def __str__(self):
    return super().__str__()
