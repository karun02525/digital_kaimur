
class Config{


    static const api_youtube='AIzaSyAiSJV9ZHpFN8AwzpUDyorMVegUMS1corw';
    static const String base64Prefix='data:image/png;base64,';

    static const baseUrl='http://192.168.1.10:8080';
    static const baseImageUrl=baseUrl+'/category/image-category/';
    static const baseProfileImageUrl=baseUrl+'/authenticate/image-profile/';

    static const String getCategoryUrl=baseUrl+'/category/get-category';
    static const String loginUrl=baseUrl+'/authenticate/login';
    static const String registerUrl=baseUrl+'/authenticate/register';
    static const String imageUpdateUrl=baseUrl+'/authenticate/profile_image_update';
    static const String vendor_verifyUrl=baseUrl+'/authenticate/vendor_verify';
    static const String vendor_registerUrl=baseUrl+'/authenticate/vendor_register';
    static const String notificationsUrl=baseUrl+'/authenticate/notifications';




    static const String authenticateUrl=baseUrl+'/api/oauth/authenticate';
    static const String addCategoryUrl=baseUrl+'/api/cauth/addcategory';
    static const String addProductUrl=baseUrl+'/api/cauth/addproduct';
    static const String addReviewUrl=baseUrl+'/api/cauth/addreview';
    static const String getScannerUrl=baseUrl+'/api/oauth/sproduct';

    static const String doReviewLikeUrl=baseUrl+'/api/cauth/rlike';
    static const String doReviewCommentUrl=baseUrl+'/api/cauth/rcomment';


    static const String getHomeUrl=baseUrl+'/api/oauth/review/1';

    static const String getReviewDetailsUrl=baseUrl+'/api/oauth/openproduct';
    static const String getReviewListDetailsUrl=baseUrl+'/api/oauth/ireview';


    static const String getReviewCommentUrl=baseUrl+'/api/oauth/ireviewc';
    static const String getAllCommentUrl=baseUrl+'/api/oauth/allcomment';

    static const String getAllCategoryUrl=baseUrl+'/api/oauth/allcategory';
    static const String getFollowUrl=baseUrl+'/api/cauth/cfollow';


    static const String geProductsUrl=baseUrl+'/api/oauth/products';
    static const String getDefaultReviewUrl=baseUrl+'/api/oauth/defaultreview';

    static const String token=
     'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNTkyOTA4NDk3NTk1IiwiYXV0aCI6eyJhdXRob3JpdHkiOiJ1c2VyX2thcnVuIn0sImlhdCI6MTU5MjkxMzA2NSwiZXhwIjoxNTkyOTE2MDY1fQ.p5BzcTTjsJ3JPE4PFDaj0G7XLClL5lwTZVAEIVFejwk';

    static const String avatar1='https://yt3.ggpht.com/a/AGF-l79qOCl2IUTeTXzxfd5R_x83FZildu-caGbqAw=s900-c-k-c0xffffffff-no-rj-mo';
    static const String avatar='https://www.mobiletoones.com/downloads/wallpapers/people_wallpapers/preview/44/65525-karunkumar.jpg';
}