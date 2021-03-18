from django.contrib import admin
from .models import S3ImageObject

@admin.register(S3ImageObject)
class S3ImageObjectAdmin(admin.ModelAdmin):
  list_display = ('filename', )
  readonly_fields = ('image_tag', )
