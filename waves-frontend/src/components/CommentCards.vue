<template>
  <el-row>
    <el-card
      :body-style="{ padding: '20px' }"
      v-for="comment in getComments"
      :key="comment.id"
    >
      <el-row>
        <el-col :span="2">
          <img
            style="border-radius: 50%;width:40px"
            class="profile-img"
            :src="
              `https://eu.ui-avatars.com/api/?rounded=true&name=${comment.full_name || 'John Doe'}`
            "
          />
        </el-col>
        <el-col :span="21" :offset="1">
          <el-row>
            <span class="userName">John Doe</span>
            <time-ago
              style="
              color:grey;
              text-decoration:none;"
              class="title"
              :datetime="comment.created_at"
              refresh
              :locale="locale"
              :long="longString"
            ></time-ago>
            <CommentButton style="float:right;height:1px" />
          </el-row>
          <el-row style="margin-top:8px;">
            <span>{{ comment.text }}</span>
          </el-row>
          <VoteForm :votes="comment.votes" :commentId="comment.idcomment" />
        </el-col>
      </el-row>
    </el-card>
  </el-row>
</template>

<script>
import TimeAgo from "vue2-timeago";
import VoteForm from "../components/VoteForm";
import CommentButton from "../components/CommentButton";
import { mapActions, mapGetters } from "vuex";

export default {
  name: "CommentCards",
  components: {
    TimeAgo,
    VoteForm,
    CommentButton
  },
  props: ["pid"],
  data() {
    return {
      value: new Date(),
      locale: "en",
      longString: false,
      tooltip: true
    };
  },
  computed: {
    ...mapGetters(["getComments"])
  },
  methods: {
    ...mapActions(["FETCH_COMMENTS"])
  },
  mounted() {
    this.FETCH_COMMENTS(this.pid);
  }
};
</script>

<style>
.userName {
  margin-right: 4px;
  margin-bottom: 10px;
  font-size: 1rem;
}

.profile-img {
  border-radius: 50%;
}
</style>
