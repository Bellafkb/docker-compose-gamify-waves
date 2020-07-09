<template>
  <div>
    <el-dialog title="Achievement" :visible.sync="dialogTableVisible">
      <Achievement />
    </el-dialog>
    <el-form :model="achievement" ref="achievement" class="columns-container">
      <el-row style="margin-top:10px">
        <el-col :span="12">
          <el-row>
            <el-card style="width:95%" title="Badge">
              <el-form-item label="name" prop="name">
                <el-input
                  v-model="achievement.badge.name"
                  placeholder="input badge name..."
                ></el-input>
              </el-form-item>

              <el-form-item label="description" prop="desc">
                <el-input
                  type="textarea"
                  v-model="achievement.badge.desc"
                  placeholder="input badge description..."
                ></el-input>
              </el-form-item>
              <el-form-item label="image url" prop="imge_url">
                <el-input
                  v-model="achievement.badge.img_url"
                  placeholder="image url..."
                ></el-input>
              </el-form-item>
            </el-card>
          </el-row>

          <el-row>
            <el-card style="width:95%">
              <el-row>
                <el-col :span="24">
                  <el-button
                    style="width:100%"
                    type="success"
                    @click="addChallenge"
                  >
                    ADD CHALLENGE</el-button
                  >
                </el-col>
              </el-row>

              <el-row style="margin-top:20px">
                <el-button @click="submit" type="success" style="width:100%"
                  ><strong>CREATE ACHIEVEMENT</strong>
                </el-button>
              </el-row>
              <el-row style="margin-top:20px">
                <el-button
                  @click="() => (dialogTableVisible = true)"
                  type="warning"
                  style="width:100%"
                  ><strong>PREVIEW</strong>
                </el-button>
              </el-row>
            </el-card>
          </el-row>
        </el-col>
        <el-col :span="12">
          <el-row v-for="(challenge, i) in achievement.challenges" :key="i">
            <el-collapse-transition>
              <el-card style="width:100%">
                <el-form-item label="type" prop="type">
                  <el-select
                    v-model="challenge.type"
                    :placeholder="$t('poolEventForm.input.type.placeholder')"
                  >
                    <el-option label="poolevent" value="poolevents"></el-option>
                    <el-option label="comment" value="comments"></el-option>
                    <el-option label="vote" value="votes"></el-option>
                    <el-option label="profile" value="profiles"></el-option>
                    <el-option
                      label="connection"
                      value="connections"
                    ></el-option>
                    <el-option label="info" value="info"></el-option>
                    <el-option
                      label="application"
                      value="applications"
                    ></el-option>
                  </el-select>
                </el-form-item>
                <el-form-item label="points" prop="desc">
                  <el-input-number
                    v-model="challenge.points"
                    :min="0"
                    :step="1"
                  ></el-input-number>
                </el-form-item>
                <el-row>
                  <el-button
                    @click="deleteChallenge(i)"
                    style="float:right"
                    size="mini"
                    type="danger"
                    circle
                  >
                    <strong><i class="el-icon-close"></i></strong>
                  </el-button>
                </el-row>
              </el-card>
            </el-collapse-transition>
          </el-row>
        </el-col>
      </el-row>
    </el-form>
  </div>
</template>

<script>
import Achievement from "../components/Achievement";
import { mapActions } from "vuex";

export default {
  name: "CreateChallengeView",
  components: {
    Achievement
  },
  data() {
    return {
      error: [],
      numberOfChallenges: 1,
      achievement: {
        badge: {
          name: "",
          desc: "",
          img_url: ""
        },
        challenges: [
          {
            points: "",
            type: ""
          }
        ]
      },
      data: "",
      dialogTableVisible: false
    };
  },
  methods: {
    ...mapActions(["POST_ACHIEVEMENT"]),
    submit() {
      this.POST_ACHIEVEMENT(this.achievement);
    },
    addChallenge() {
      this.achievement.challenges.push({
        name: "",
        points: ""
      });
    },
    deleteChallenge(index) {
      this.achievement.challenges.splice(index, 1);
      if (index === 0) this.addChallenge();
    }
  }
};
</script>

<style></style>
