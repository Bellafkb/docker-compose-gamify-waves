<template>
  <el-row style="padding:0;margin:0;">
    <el-col :xs="2" :lg="1">
      <el-button
        style="margin-top:12px;border:0;height:20px;width:20px;padding:0;"
        circle
      >
        <img
          style="height:20px;width:20px;padding:0;margin:0"
          @click="submit"
          alt="vote-button"
          :src="liked ? filledImg : heartImg"
          @mouseover="heartImg = filledImg"
          @mouseleave="heartImg = emptyImg"
        />
      </el-button>
    </el-col>
    <el-col style="padding:0" :xs="1" :lg="1">
      <p style="text-align:center;color:grey">{{ votes ? votes.length : 0 }}</p>
    </el-col>
  </el-row>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "VoteForm",
  data() {
    return {
      emptyImg:
        "https://cdn2.iconfinder.com/data/icons/music-media-player-outline-basic/32/1-icon-music-09-512.png",
      filledImg:
        "https://cdn0.iconfinder.com/data/icons/twitter-24/512/166_Heart_Love_Like_Twitter-512.png",
      heartImg:
        "https://cdn2.iconfinder.com/data/icons/music-media-player-outline-basic/32/1-icon-music-09-512.png",
      user_id: "",
      liked: false
    };
  },
  props: ["commentId", "votes"],
  methods: {
    ...mapActions(["POST_VOTE"]),
    submit() {
      this.POST_VOTE({ comment_id: this.commentId });
    },
    async checkLiked() {
      const votes = await this.votes.filter(
        vote => vote.user_id == this.user_id
      );
      if (votes.length > 0) {
        this.liked = true;
      }
    }
  },
  computed: {
    ...mapGetters(["getUser"])
  }
};
</script>

<style></style>
