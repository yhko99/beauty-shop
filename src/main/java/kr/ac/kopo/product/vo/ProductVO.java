package kr.ac.kopo.product.vo;

public class ProductVO {

    private int productId;
    private String productName;
    private String brandName;
    private int price;
    private int originalPrice;
    private int discountRate;
    private String productUrl;

    public ProductVO() {}

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getBrandName() { return brandName; }
    public void setBrandName(String brandName) { this.brandName = brandName; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public int getOriginalPrice() { return originalPrice; }
    public void setOriginalPrice(int originalPrice) { this.originalPrice = originalPrice; }

    public int getDiscountRate() { return discountRate; }
    public void setDiscountRate(int discountRate) { this.discountRate = discountRate; }

    public String getProductUrl() { return productUrl; }
    public void setProductUrl(String productUrl) { this.productUrl = productUrl; }

    @Override
    public String toString() {
        return "ProductVO [productId=" + productId + ", productName=" + productName
                + ", brandName=" + brandName + ", price=" + price + "]";
    }
}