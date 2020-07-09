<template>
  <el-dropdown style="margin-top:0;padding:0" trigger="click">
    <span class="el-dropdown-link">
      <el-button
        style="transform: rotate(90deg);width:40px;float:right;margin:0;border:0"
        circle
      >
        <i class="el-icon-more"></i>
      </el-button>
    </span>
    <el-dropdown-menu style="margin:0;padding:0;width:100px" slot="dropdown">
      <ul style="list-style:none;padding:0px;margin:0px;">
        <li
          @click="
            () =>
              this.$router.push(`/waves/event/${this.$route.params.id}/edit`)
          "
          class="profile-item"
        >
          <i class="el-icon-edit"></i> edit
        </li>

        <li class="profile-item"><i class="el-icon-delete"></i> remove</li>

        <li @click="releaseHandler" class="profile-item">
          <i class="el-icon-circle-check"></i> release
        </li>
        <li @click="rejectHandler" class="profile-item">
          <i class="el-icon-circle-close"></i> reject
        </li>
        <li @click="cancelHandler" class="profile-item">
          <i class="el-icon-document-delete"></i> cancel
        </li>
      </ul>
    </el-dropdown-menu>
  </el-dropdown>
</template>

<script>
import { mapActions, mapGetters } from "vuex";

export default {
  name: "PooleventDropdown",
  props: ["poolevent"],
  computed: {
    ...mapGetters([])
  },
  methods: {
    ...mapActions(["SET_TO_CANCELED"]),
    async releaseHandler() {
      await this.$store.dispatch("SET_TO_RELEASED", this.$route.params.id);
    },
    async rejectHandler() {
      await this.$store.dispatch("SET_TO_REFUSED", this.$route.params.id);
    },
    async cancelHandler() {
      await this.SET_TO_CANCELED(this.$route.params.id);
    }
  }
};
</script>

<style></style>
