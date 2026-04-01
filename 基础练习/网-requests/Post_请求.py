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

# 练习4：发送JSON 数据
def post_json_data():
    """发送JSON格式数据"""
    # 要发送的数据
    new_post = {
        'title': 'PYTHON Requets 教程',
        'boby': '这是一个关于 Requests 库的练习案例',
        'userId': 1
    }

    response = requests.post (
        f"{BASE_URL}/posts",
        json=new_post         #自动将dict转换为JSON
    )

    print(f"状态码，：{response.status_code}")
    print(f"创建的资源：{response.json()}")

    return response.json

# 练习5：发送表单数据
def post_from_data():
    """发送表单格式数据"""
    from_data = {
        'username': 'testuser',
        'password': 'testuser',
        'email': 'testuser@test.com'
    }

    # 使用 data 参数发送表单数据
    response = requests.post(
        f"{BASE_URL}/posts",
        data=from_data
    )
    
    print(f"状态码: {response.status_code}")
    print(f"响应: {response.json()}")
    
    return response.json()    

# 练习6：上传文件
def update_file():
    """上传文件示例"""
    # 创建一个测试文件
    with open('test.txt', 'w') as f:
        f.write('这是个测试完文件内容')

    files = {
        'file': ('test.txt', open('test.txt', 'rb'), 'text/plain')
    }

    # 注意：这个API可能不支持真实上传，仅为示例
    response = requests.post(
        "https://httpbin.org/post",
        files=files
    )
    
    print(f"状态码: {response.status_code}")
    print(f"上传响应: {response.json()}")
    
    # 清理文件
    import os
    os.remove('test.txt')

if __name__ == '__main__':
    print(f"开始执行 requests POST 练习")
    post_json_data()
    post_from_data()
    update_file()