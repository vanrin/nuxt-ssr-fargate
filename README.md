# nuxt-ssr-fargate

## Build Setup

This repo is for dockerize deployment demo on ECS Fargate. So, We only focus on build docker image.

```bash
# To build image
$ docker-compose build

# run test on local
$ docker-compose up -d
```

Specific configuration for docker deployment

```
export default {
  ssr: true,
  publicRuntimeConfig: {
    pageHeadLine: process.env.PAGE_HEAD_LINE || 'SIGN UP TODAY',
  }
}
```