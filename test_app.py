import pytest
from app.app import app

@pytest.fixture
def client():
    """Create a test client for the Flask app"""
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_app_starts(client):
    """Test that the app starts without crashing"""
    assert client is not None

def test_home_endpoint(client):
    """Test the / endpoint returns correct response"""
    response = client.get('/')
    assert response.status_code == 200
    assert response.data == b"Hello DevSecOps!"

def test_health_endpoint(client):
    """Test the /health endpoint returns correct JSON"""
    response = client.get('/health')
    assert response.status_code == 200
    data = response.get_json()
    assert data['status'] == 'UP'
    assert data['message'] == 'Application is healthy'

def test_info_endpoint(client):
    """Test the /info endpoint returns correct JSON"""
    response = client.get('/info')
    assert response.status_code == 200
    data = response.get_json()
    assert data['app'] == 'DevSecOps Demo'
    assert data['version'] == '1.0.0'
