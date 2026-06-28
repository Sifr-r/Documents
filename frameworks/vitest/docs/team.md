# Meet the Team

## Introduction

<script setup>
import {
  VPTeamPage,
  VPTeamPageTitle,
  VPTeamPageSection,
  VPTeamMembers
} from 'vitepress/theme'
import { teamMembers, teamEmeritiMembers } from './.vitepress/contributors'
</script>

  
    <template #title>Meet the Team</template>
    <template #lead>
      The development of Vitest is guided by an international team, some of whom
      have chosen to be featured below.
    </template>
  
  <VPTeamMembers :members="teamMembers" />
  
    <template #title>Team Emeriti</template>
    <template #lead>
      Here we honor some no-longer-active team members who have made valuable
      contributions in the past.
    </template>
    <template #members>
      <VPTeamMembers size="small" :members="teamEmeritiMembers" />
    </template>

