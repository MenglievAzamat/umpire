<template>
    <div class="canvas">
        <logo />
    </div>
</template>

<script>
    import Logo from "../Logo";
    export default {
      name: "ox-loading",
      props: [ "color" ],
      components: {Logo}
    }
</script>

<style scoped lang="scss">
    .canvas {
        width: 10rem;
        height: 10rem;
        overflow: hidden;
        border-radius: 50%;
        background: white;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);

        animation: loading 1.5s linear infinite;
    }

    @keyframes loading {
        0% {
            transform: translate(-50%, -50%) scale(1);
        }
        10% {
            transform: translate(-50%, -50%) scale(1.1);
        }
        90% {
            transform: translate(-50%, -50%) scale(1.1) rotateZ(360deg);
        }
        100% {
            transform: translate(-50%, -50%) scale(1) rotateZ(360deg);
        }
    }
</style>
