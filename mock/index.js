/**
 * 2018/8/14 下午10:30
 */

let Random = Mock.Random


// 登录
Mock.mock(/login/, {
    code: 0,
    message: "success",
    data: {
        token: "@sentence",
        uid: 1,
    }
});

// 用户信息
Mock.mock(/userInfo/, {
    code: 0,
    message: 'success',
    data: {
        "uid|10000-99999": 1,
        avatar:
            "http://imgold.doufu.la/e3/63/7d2421e0c018f7bb52428e7f9f.png",
        nickname: "橙红年代",
        "likeNum|1-10":1,
        "fansNum|1-199":1,
        "focusNum|1-5": 1,
    }
})

// 首页笑话列表
Mock.mock(/jokeList/, 'get', {
    code: 0,
    message: 'success',
    "data|5": [{
        "id|+3": 10000,
        author: {
            "uid|+100": 9912,
            nickname: '@cname',
            avatar: Random.image('50X50')
        },
        joke: {
            content: Random.cparagraph(5, 15),
            image: Random.image('150X150')
        },
        "likeNum|1-1000": 1,
        "dislikeNum|1-1000": 1,
        "commentNum|5-10": 1
    }]
})
Mock.mock(/jokeDetail/, "get", {
    code: 0,
    message: "success",
    data: {
        "id|+10": 10000,
        author: {
            "uid|+100": 9912,
            nickname: "@cname",
            avatar: Random.image("50X50")
        },
        joke: {
            content: Random.cparagraph(10, 30),
            image: Random.image("150X150")
        },
        "likeNum|1-1000": 1,
        "dislikeNum|1-1000": 1,
        "commentNum|5-10": 1
    }
});
