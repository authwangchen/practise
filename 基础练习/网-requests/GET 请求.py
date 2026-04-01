import requests
import json
'''
requests :Http 客户端库，
核心作用：简化 HTTP请求发送与响应处理，让python程序能够与web服务器、API 接口进行通信

requests.get()
requests.post()
response.text
response.json() 
'''

# 基础配置
BASE_URL = "https://jsonplaceholder.typicode.com"

# 练习1：基础Git请求
def basic_get():
    """最基础的Get 请求"""
    response = requests.get(f"{BASE_URL}/posts/1")
    print(f"response 变量内容展示：{response}")

    # 查看响应状态码
    print(f"状态码：{response.status_code}")

    # 查看响应内容（文本格式）   [:200]：作用，用来控制展示内容的长度
    print(f"文本内容：{response.text[:200]}...")
    print(f"文本内容，取消[:200]，进行差异化对比：{response.text[:200]}...")

    # 查看响应内容 （Json格式）
    print(f"JSON响应：{response.json()}")

    # 查看响应头
    print(f"响应头：{response.headers}")


# 练习2：带参数的GET请求
def get_with_params():
    """带查询参数的GET请求"""
    params = {
        'userID': 1,
        '_limit': 3
    }

    response = requests.get(f"{BASE_URL}/posts", params=params)

    print(f"请求URL：{response.url}")
    print(f"返回数据量：{len(response.json())}")
    print(f"数据：{response.json()}")

# 练习3 自定义请求头
def get_with_headers():
    """带自定义请求头的GET请求"""
    headers = {
        'User-Agent': 'MyApp/1.0',
        'Accept': 'application/json',
        'Authorization': 'Bearer your_token_here'
    }

    response = requests.get(
        f"{BASE_URL}/posts/1",
        headers=headers
    )

    print(f"状态码：{response.status_code}")
    print(f"请求头已发送：{response.request.headers}")

if __name__ == '__main__':
    print(f"开始执行 requests Get 练习")
    basic_get()
    get_with_params()
    get_with_headers()