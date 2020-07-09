<template>
  <div style="margin:auto;width:100%">
    <el-tabs tab-position="left">
      <el-tab-pane label="Poolevent-Type">
        <el-row>
          <el-col :span="24">
            <el-input v-model="pe_type" placeholder="event type..."></el-input>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-button style="width:100%;margin-top:10px" type="primary" @click="submit">
              <strong>CREATE</strong>
            </el-button>
          </el-col>
        </el-row>
        <el-divider />
        <el-row>
          <el-table :data="eventtypes" style="width: 100%">
            <el-table-column label="Name" prop="name"></el-table-column>
            <el-table-column label="Date" prop="created_at"></el-table-column>
          </el-table>
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="Gamify-Achievements">
        <AchievementCreater :actions="actions" />
      </el-tab-pane>
      <el-tab-pane label="Gamify-Actions">
        <el-row>
          <el-col :span="24">
            <el-input v-model="action.name" placeholder="action name ..."></el-input>
          </el-col>
          <el-col style="margin-top:10px" :span="24">
            <el-input v-model="action.points" placeholder="points ..."></el-input>
          </el-col>
          <el-col style="margin-top:10px" :span="24">
            <el-input v-model="action.type" placeholder="type ..."></el-input>
          </el-col>
        </el-row>
        <el-row style="margin-top:10px">
          <el-button style="width:100%" type="success" @click="submit">
            <strong>CREATE</strong>
          </el-button>
        </el-row>
        <el-divider />
        <el-row style="margin:auto;margin-top:20px">
          <el-table :data="actions" style="width: 100%">
            <el-table-column label="Actions" prop="id_action"></el-table-column>
            <el-table-column label="Points" prop="points"></el-table-column>
            <el-table-column label="type" prop="type"></el-table-column>
            <el-table-column label="Date" prop="created_at"></el-table-column>
          </el-table>
        </el-row>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import AchievementCreater from "../components/AchievementCreater";
import { mapActions, mapGetters } from "vuex";

export default {
  name: "DaschboardView",
  components: {
    AchievementCreater
  },
  data() {
    return {
      action: {
        points: "",
        type: "",
        name: ""
      },
      pe_type: "",
      event_types: []
    };
  },
  computed: {
    ...mapGetters(["eventtypes", "actions"])
  },
  async mounted() {
    await this.fetchAllTypes();
    this.FETCH_GAMIFY_ACTIONS();
  },
  methods: {
    ...mapActions([
      "POST_EVENTTYPE",
      "FETCH_EVENTTYPES",
      "FETCH_GAMIFY_ACTIONS"
    ]),
    submit() {
      this.POST_EVENTTYPE(this.pe_type);
    },
    async fetchAllTypes() {
      try {
        await this.FETCH_EVENTTYPES();
      } catch (error) {
        throw error.message;
      }
    }
  }
};
</script>

<style></style>
