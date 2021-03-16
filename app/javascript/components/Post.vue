<template>
  <article :id="`post-${post.id}`" class="w-full flex bg-white p-3 border-b border-gray-200 box-border">
    <figure class="mr-2">
      <img :src="post.user.avatar" class="rounded-full" width="50" alt="avatar">
    </figure>
    <div class="flex flex-col w-full">
      <div class="flex md:flex-row flex-col w-full md:items-center items-start">
        <p class="font-bold mr-2">{{ name || emailTruncated }}</p>
        <p class="text-gray-600 mr-2">@{{ emailTruncated }}</p>
        <p class="hidden md:flex text-gray-600 ml-auto">
          <span>{{ timeAgo }}</span>
        </p>
      </div>
      <div class="mt-1">
        <p class="py-1">{{ post.content }}</p>
      </div>
      <div class="flex items-center pt-3">
        <button class="link-icon md:mr-12 mr-6 p-2 text-gray-500 hover:text-green-500">
          <i class="fas fa-comment mr-1"></i>
          <span class="text-sm">3</span>
        </button>
        <button class="link-icon md:mr-12 mr-6 p-2 text-gray-500 hover:text-blue-500">
          <i class="fas fa-share mr-1"></i>
          <span class="text-sm">10</span>
        </button>
        <button class="link-icon md:mr-12 mr-6 p-2 text-gray-500 hover:text-red-500">
          <i class="fas fa-heart mr-1"></i>
          <span class="text-sm">10</span>
        </button>
        <button class="link-icon md:mr-12 mr-6 p-2 text-gray-500 hover:text-purple-500">
          <i class="fas fa-bookmark mr-1"></i>
        </button>
      </div>
    </div>
  </article>
</template>

<script>
  import moment from 'moment'

  export default {
    name: 'Post',
    props: {
      post: {
        type: Object,
        required: true
      }
    },
    computed: {
      name() {
        return this.post.user?.name
      },
      emailTruncated() {
        return this.post.user?.email.split("@")[0].trim()
      },
      timeAgo() {
        return moment(this.post.created_at).fromNow()
      },
    },
  }
</script>
