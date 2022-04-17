from django.contrib import admin
from .models import Post, Comment


class CommentAdmin(admin.ModelAdmin):
    list_display = ('name', 'body', 'post', 'created_on', 'active')
    list_filter = ('active', 'created_on')
    search_fields = ('name', 'email', 'body')
    actions = ['approve_comments']

    def approve_comments(self, request, queryset):
        queryset.update(active=True)

admin.site.site_header = 'Teomaz Blog'
admin.site.index_title = 'Teodorico Mazivilas Admin Panel'
admin.site.site_title = 'Blog Website Teomaz_Blog'

admin.site.register(Post)
admin.site.register(Comment)
