<template>
  <Container style="width:50%;margin:auto">
    <Row>
      <h3>Your Notifications</h3>
      <Card v-for="notification in notifications" :key="notification.id">{{notification.type}}</Card>
    </Row>
  </Container>
</template>

<script>
import axios from "axios";
import { Card, Container, Row } from "element-ui";
export default {
  name: "NotificationsView",
  components: {
    Container,
    Card,
    Row
  },
  data() {
    return {
      notifications: []
    };
  },
  async mounted() {
    const { data } = await axios.get("/waves/api/v1/notification/1");
    this.notifications = data.data;
  }
};
</script>

<style>
</style>