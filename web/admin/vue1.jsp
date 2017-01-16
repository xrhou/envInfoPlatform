<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="../js/vue.min.js"></script>
    <title>vue-houxr</title>
</head>
<body>
    <div id="app">
        {{ message }}
    </div>

    <div id="app-4">
        <ol>
            <li v-for="todo in todos">
                {{ todo.text }}
            </li>
        </ol>
    </div>

    <div id="app-5">
        <p>{{ message }}</p>
        <button v-on:click="reverseMessage">Reverse Message</button>
    </div>

</body>

<script>
    var app = new Vue({
        el: '#app',
        data: {
            message: 'Hello houxr!'
        }
    })

    var app4 = new Vue({
        el: '#app-4',
        data: {
            todos: [
                {text: 'Learn JavaScript'},
                {text: 'Learn Vue'},
                {text: 'Build something awesome'}
            ]
        }
    })

    var app5 = new Vue({
        el: '#app-5',
        data: {
            message: 'Hello Vue.js!'
        },
        methods: {
            reverseMessage: function () {
                this.message = this.message.split('').reverse().join('')
            }
        }
    })
</script>
</html>