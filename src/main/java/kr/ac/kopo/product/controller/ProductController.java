package kr.ac.kopo.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.product.service.ProductService;
import kr.ac.kopo.product.vo.ProductVO;
import kr.ac.kopo.product.vo.ReviewVO;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    // 상품 목록
    @GetMapping("/product")
    public String list(@RequestParam(name="keyword", defaultValue="") String keyword,
                       @RequestParam(name="brandName", defaultValue="") String brandName,
                       @RequestParam(name="orderBy", defaultValue="price") String orderBy,
                       Model model) {

        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        params.put("brandName", brandName);
        params.put("orderBy", orderBy);

        List<ProductVO> productList = productService.selectList(params);
        int totalCount = productService.selectCount(params);

        model.addAttribute("productList", productList);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("keyword", keyword);
        model.addAttribute("brandName", brandName);
        model.addAttribute("orderBy", orderBy);

        return "product/list";
    }

    // 상품 상세
    @GetMapping("/product/{productId}")
    public String detail(@PathVariable("productId") int productId,
                         @RequestParam(name="page", defaultValue="1") int page,
                         Model model) {

        Map<String, Object> params = new HashMap<>();
        params.put("productId", productId);
        params.put("offset", (page - 1) * 10);
        params.put("limit", 10);

        ProductVO product = productService.selectOne(productId);
        List<ReviewVO> reviewList = productService.selectReviewList(params);
        int reviewCount = productService.selectReviewCount(productId);

        model.addAttribute("product", product);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("reviewCount", reviewCount);
        model.addAttribute("page", page);
        model.addAttribute("totalPage", (int) Math.ceil((double) reviewCount / 10));

        return "product/detail";
    }

    // 상품 추가 폼
    @GetMapping("/product/addForm")
    public String addForm() {
        return "product/addForm";
    }

    // 상품 추가 처리
    @PostMapping("/product/add")
    public String add(ProductVO productVO) {
        productService.insert(productVO);
        return "redirect:/product";
    }

    // 상품 수정 폼
    @GetMapping("/product/editForm/{productId}")
    public String editForm(@PathVariable("productId") int productId, Model model) {
        ProductVO product = productService.selectOne(productId);
        model.addAttribute("product", product);
        return "product/editForm";
    }

    // 상품 수정 처리
    @PostMapping("/product/edit")
    public String edit(ProductVO productVO) {
        productService.update(productVO);
        return "redirect:/product";
    }

    // 상품 삭제
    @GetMapping("/product/delete/{productId}")
    public String delete(@PathVariable("productId") int productId) {
        productService.delete(productId);
        return "redirect:/product";
    }
}