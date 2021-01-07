window.addEventListener('load', function(){
  const CategoryList = document.getElementById('category-list')
  const BrandList = document.getElementById('brand-list')
  const PullDown = document.getElementById('pull-down')
  const PullDown2 = document.getElementById('pull-down2')

  CategoryList.addEventListener('mouseover', function(){
    PullDown.setAttribute("style", "display:block;")
  })
  PullDown.addEventListener('mouseover', function(){
    this.setAttribute("style", "display:block;")
  })
  PullDown.addEventListener('mouseout', function(){
    PullDown.removeAttribute("style", "display:none;")
  })
  PullDown2.addEventListener('mouseover', function(){
    this.setAttribute("style", "display:block;")
  })
  PullDown2.addEventListener('mouseout', function(){
    this.removeAttribute("style", "display:none;")
  })
  BrandList.addEventListener('mouseover', function(){
    PullDown2.setAttribute("style", "display:block;")
  })
});