<template>
  <el-card style="padding:0">
    <el-form :model="comment">
      <el-row style="margin-top:10px">
        <el-col :span="1" :offset="0">
          <img
            style="width:40px"
            alt="avatar"
            :src="
              `https://eu.ui-avatars.com/api/?rounded=true&name=${getUser.firstName}+${getUser.lastName}`
            "
          />
        </el-col>
        <el-col :span="21" :offset="2">
          <el-row style="margin:0px;padding:0px;">
            <el-input
              show-word-limit
              placeholder="Please input"
              v-model="comment.text"
              maxlength="1000"
              :autosize="{ minRows: 2, maxRows: 10 }"
              type="textraea"
            ></el-input>
          </el-row>
        </el-col>
      </el-row>
      <el-row style="padding:0">
        <el-button
          type="primary"
          style="width:100px;float:right;margin-top:10px"
          @click.prevent="submit"
          :disabled="!comment.text"
          >comment</el-button
        >
        <el-button
          type="danger"
          style="width:100px;float:right;margin-top:10px;margin-right:10px"
          :disabled="!comment.text"
          >cancel</el-button
        >
      </el-row>
    </el-form>
  </el-card>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
export default {
  name: "CommentForm",
  data() {
    return {
      comment: {
        text: "",
        pId: this.$route.params.id
      },
      id: this.$route.params.id
    };
  },
  methods: {
    ...mapActions(["SUBMIT_COMMENT"]),
    async submit() {
      console.log("-->",this.comment);
      if (!this.comment.text) {
        alert("comment section empty");
      } else {
        try {
          
          await this.SUBMIT_COMMENT({
            data: this.comment
          });
          this.comment.text = "";
        } catch (error) {
          throw error;
        }
      }
    }
  },
  computed: {
    ...mapGetters(["getUser"])
  }
};
</script>

<style>
.comment-text-area {
  border: 0ch;
  border-bottom: 1px solid;
  color: gray;
  padding: 10px;
  border-radius: 0;
}
</style>
