<template>
  <main class="h-full">
    <div>
      <h2 class="text-xl p-5 border-b-2 border-gray-200">Home</h2>
    </div>
    <div class="py-12 border-b-2 border-gray-200">
      <h1 class="text-2xl text-center">Form</h1>
    </div>
    <div class="bg-gray-100 h-screen">
      <div class="pt-3" v-for="post in posts" :key="post.id">
        <Post :post="post" />
      </div>
    </div>
  </main>
</template>

<script>
  import Post from '../../components/Post'

  export default {
    components: {
      Post
    },
    props: {
      posts: {
        type: Array,
        required: true,
      }
    }  
  }
</script>
