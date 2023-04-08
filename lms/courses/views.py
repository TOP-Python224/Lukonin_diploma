from django.shortcuts import render
from django.views.generic.list import ListView
from .models import Course
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
# Create your views here.
class ManageCourseListView(ListView):
 model = Course
 template_name = 'courses/manage/course/list.html'
 def get_queryset(self):
    qs = super().get_queryset()
    return qs.filter(owner=self.request.user)





class OwnerMixin:
    def get_queryset(self):
        qs = super().get_queryset()
        return qs.filter(owner=self.request.user)



class OwnerCourseMixin(OwnerMixin):
     model = Course
     fields = ['subject', 'title', 'slug', 'overview']
     success_url = reverse_lazy('manage_course_list')


class OwnerEditMixin:
    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super().form_valid(form)


class OwnerCourseEditMixin(OwnerCourseMixin, OwnerEditMixin):
     template_name = 'courses/manage/course/form.html'

 class ManageCourseListView(OwnerCourseMixin, ListView):
     template_name = 'courses/manage/course/list.html'

 class CourseCreateView(OwnerCourseEditMixin, CreateView):
     pass

 class CourseUpdateView(OwnerCourseEditMixin, UpdateView):
     pass

 class CourseDeleteView(OwnerCourseMixin, DeleteView):
     template_name = 'courses/manage/course/delete.html'