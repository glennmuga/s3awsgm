name: Deploy to EKS
 
on:

  push:

    branches:

      - main
 
jobs:

  deploy:

    runs-on: ubuntu-latest
 
    steps:

    - name: Checkout code

      uses: actions/checkout@v2
 
    - name: Configure AWS credentials

      uses: aws-actions/configure-aws-credentials@v1

      with:

        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}

        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

        aws-region: ap-northeast-2
 
    - name: Set up kubectl

      uses: actions/setup-kubectl@v1

      with:

        version: '1.18.0'
 
    - name: Deploy to EKS

      run: |

        kubectl apply -f k8s/deployment.yaml

        kubectl apply -f k8s/service.yaml

 
