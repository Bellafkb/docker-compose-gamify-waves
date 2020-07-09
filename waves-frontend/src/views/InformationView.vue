<template>
  <div style="margin:auto;width:50%"> 
    <h1>Welcome to vca Pool</h1>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam doloremque deleniti at iste commodi, enim praesentium explicabo voluptatum dolores temporibus dolorem, mollitia debitis. Quod, quidem voluptate modi adipisci quas exercitationem dolore! Fuga debitis, aliquam facere autem recusandae dolorum eius neque fugiat, quaerat distinctio exercitationem ipsum laborum eaque? Debitis voluptatibus facere, laboriosam itaque aperiam quis nulla repellat obcaecati assumenda incidunt voluptas delectus aspernatur facilis sed? Sequi nihil necessitatibus ea voluptatem porro at, officia iste nam? Neque dicta aliquid velit facere praesentium repellendus beatae adipisci pariatur quod quae, quam autem eum laudantium eos! Commodi ipsam aliquam totam sint quis iusto! Ducimus, unde.</p>
    <h3>important stuff to know</h3>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Error neque enim distinctio non? Et hic, a accusantium quia fugit veritatis placeat eveniet ea provident earum mollitia quae excepturi laboriosam praesentium rem. Modi magnam adipisci amet officia harum iure tempora expedita, quae sunt eos autem velit delectus pariatur fugiat officiis hic provident unde facilis similique. Quod sed unde rem aperiam! Culpa, possimus numquam ratione, porro aliquid explicabo esse eligendi nam corrupti animi atque aperiam autem, ullam asperiores! Adipisci, consequuntur! Maxime, facilis. Distinctio minus saepe dignissimos libero corrupti perferendis, at dolorum eligendi blanditiis enim sed eum inventore exercitationem similique odit adipisci eos, tempore officia iste accusantium tempora atque nulla? Maiores quas non minus esse voluptate expedita dolorum eius, repellat beatae! Laboriosam aliquid magni saepe quas ducimus cum delectus illo odio veritatis eos explicabo ut dolores voluptatem, maxime consectetur commodi ipsam amet iste cupiditate, officia nisi sit nobis? Vero amet laudantium obcaecati error similique asperiores deleniti esse blanditiis voluptatum iusto ratione nulla perferendis perspiciatis cupiditate eligendi quisquam commodi necessitatibus, iste dicta ducimus corrupti illo? Voluptatem distinctio quam nobis, modi quidem delectus vitae, asperiores ab ut reprehenderit nihil esse error nesciunt illum, itaque excepturi? Soluta ipsam aspernatur vel non, harum illum molestiae quis totam!</p>
    <h3>other important stuff to know</h3>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia, veniam? Qui ipsam eum, sapiente alias repudiandae placeat maiores. Illo quo atque dignissimos ratione molestiae, adipisci voluptates? Libero impedit velit dolore blanditiis ea, modi facere neque quia, voluptates aliquam soluta reiciendis esse. Eveniet in eaque ullam totam, nam obcaecati voluptas tempora ducimus. Sint, praesentium sapiente possimus natus debitis quam odit enim? Repellat quas mollitia id similique delectus. Veritatis dolore modi eum nesciunt deleniti saepe ratione pariatur amet porro, expedita animi fuga, culpa reprehenderit architecto atque perferendis id voluptatem dolor recusandae autem, eius suscipit. Illo velit enim, impedit, voluptates ullam maiores qui cum quam laudantium officiis esse soluta quia. Tenetur, aliquam? Aut cumque ipsa unde ipsum vel a sed quo accusamus assumenda asperiores quis explicabo voluptatum maxime sunt officia repudiandae eveniet veritatis exercitationem qui, necessitatibus dolorum natus aperiam eius? Repellat at impedit laboriosam eos velit placeat rem beatae ducimus fugit ipsam, facere eum ipsa incidunt esse quis ad debitis officia ut perferendis numquam dicta totam quos modi natus. Pariatur aperiam cum reprehenderit iusto totam laudantium ex in similique incidunt, atque asperiores tempore, commodi, soluta unde consectetur velit sequi accusamus minus explicabo vel error? Ea dicta repellendus, enim eum facilis quod tempore ipsam voluptatem non alias! Rerum delectus explicabo libero nulla reiciendis provident impedit tempora sint mollitia quas, esse corrupti quidem fugiat facere neque. Doloribus ipsum quae modi natus? Sunt doloribus laudantium rem ratione exercitationem ipsum, nostrum placeat repudiandae omnis eveniet nihil autem porro architecto dignissimos deserunt a sapiente explicabo repellat? Nobis enim deleniti itaque veritatis, pariatur aperiam exercitationem, perspiciatis ducimus excepturi nam consectetur illum sapiente ut numquam natus? Nihil blanditiis nesciunt voluptas id architecto culpa ut magnam, illo, fugit maiores aperiam doloremque, itaque quis? Nostrum fuga delectus autem aperiam? Voluptatum, illo consequuntur. Omnis est commodi nobis, veritatis quibusdam, possimus tempore ab aliquid recusandae magni numquam, necessitatibus voluptatum? Omnis esse numquam amet laboriosam eligendi hic earum, vel aliquid, eveniet laborum reiciendis neque laudantium a. At voluptatem odio accusamus. Nostrum quae, corrupti inventore nesciunt nulla cum repudiandae dolorem ullam reprehenderit assumenda voluptas delectus officiis, obcaecati, accusamus nam atque ipsa ipsum aperiam earum laborum dignissimos neque unde? Delectus fuga eligendi quod saepe eum eius sint dolorem? Cum eum et numquam consectetur natus illo placeat necessitatibus quo velit aliquam totam iure neque quos accusantium minus expedita temporibus fuga perspiciatis, dolorum voluptatem quasi. Distinctio, ab. Rerum eveniet dignissimos impedit magni cumque, cum maiores possimus vero. Officia, quas!</p>
  </div>
</template>

<script>
import Axios from "axios";
export default {
  name: "InformationView",
  data() {
    return {
      information: ""
    };
  },
  async mounted() {
    const { data } = await Axios.get("/waves/api/v1/info", {
      headers: {
        Authorization: `Bearer ${this.$cookies.get("access_token")}`
      }
    });
  }
};
</script>

<style>
</style>