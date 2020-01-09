$(function(){
  $('.image-list').hover(
    function(){
      var big = $('.product-box-content__product-main-content__product-image__big');
      var imageList = $(this).addClass('image-list-active');
      var index = imageList.index();

      if(!big.hasClass('sliding')) {
        big.addClass('sliding').animate({
          'scrollLeft': index * 300
        }, {
          'complete': function() {
            big.removeClass("sliding");
          }
        }, 500);
      }
    },
    function(){
      $(this).removeClass('image-list-active')
    }
  );
})

//ここからセレクトボックス
$(function(){

  function appendOption_c(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendOption_d(delivery){
    var html = `<option value="${delivery.id}">${delivery.responsibility}</option>`
    return html;
  }

  function appendChidrenBox(insertHTML){ // 子セレクトボックスのhtml作成
    var childSelectHtml = '';
      childSelectHtml = `<div class='product-select-wrapper' id= 'children_wrapper'>
                        <div class='product_category-select'>
                        <select class="category_select-box" id="child_category" name="product[category_id]">
                        <option value="---">---</option>
                        ${insertHTML}
                        </select>
                        </div>
                        <div class= 'select-grandchildren'>
                        </div>
                        </div>`;
    $('.select-children').append(childSelectHtml);
  }

  function appendgrandChidrenBox(insertHTML){ // 孫セレクトボックスのhtml作成
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='product-select-wrapper' id= 'grandchildren_wrapper'>
                              <div class='product_category-select'>
                              <select class="category_select-box" id="grandchild_category" name="product[category_id]">
                              <option value="---">---</option>
                              ${insertHTML} 
                              </select>
                              </div>
                              <div class= 'product_select-grandchildren'>
                              </div>
                              </div>`;
    $('.select-grandchildren').append(grandchildrenSelectHtml);
  }

  function appendDeliveryChildrenBox(insertHTML){
    var deliverychildrenSelectHtml = '';
    deliverychildrenSelectHtml = `<div class="form-group" id="form-group_children">
                                  <label>
                                  配送の方法
                                  <span class="form-require">必須</span>
                                  </label>
                                  <div>
                                  <div class="select-wrap">
                                  <i class="icon-arrow-bottom"></i>
                                  <select class="select-default" id="delivery_children" name="product[delivery_id]"><option value="">---</option>
                                  ${insertHTML}
                                  </select>
                                  </div>
                                  </div>
                                  </div>
                                  <div class="form-group_children></div>"`
    $(".form-group_children").append(deliverychildrenSelectHtml);
  }



  $(document).on('change', '#category_select', function(){  // 親セレクトボックスの選択肢を変えたらイベント発火
    $('#children_wrapper2').remove(); 
    $('#grandchildren_wrapper2').remove();
    var productcategory = document.getElementById('category_select').value; //
  // ↑ productcategoryに選択した親のvalueを代入
    if (productcategory != ''){
 // ↑ productcategoryが空ではない場合のみAjax通信を行う｡選択肢を初期選択肢'---'に変えると､通信失敗となってしまうため｡
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(children){  // 送られてきたデータをchildrenに代入
        var insertHTML = '';
        children.forEach(function(child){  
  // forEachでchildに一つずつデータを代入｡子のoptionが一つずつ作成される｡
          insertHTML += appendOption_c(child); 
        });
        appendChidrenBox(insertHTML); 
        $(document).on('change', '#category_select', function(){
  // 通信成功時に親の選択肢を変えたらイベント発火｡子と孫を削除｡selectのidにかけるのではなく､親要素にかけないと残ってしまう
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });


  // document､もしくは親を指定しないと発火しない
  $(document).on('change', '#child_category', function(){
    $('#grandchildren_wrapper2').remove();
    var productcategory = document.getElementById('child_category').value;
    if (productcategory != ''){
    $.ajax ({
      url: 'category_grandchildren',
      type: 'GET',
      data: { productcategory: productcategory },
      dataType: 'json'
    })
    .done(function(grandchildren){
      var insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption_c(grandchild);
        });
        appendgrandChidrenBox(insertHTML);  
        $(document).on('change', '#child_category',function(){
          $('#grandchildren_wrapper').remove();
          })
        })  
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
    }
  });

  $(document).on('change', '#delivery_select', function(){
    $("#form-group_children2").remove();
    var productdelivery = document.getElementById('delivery_select').value;

    if (productdelivery != ''){

      $.ajax ({
        url: 'delivery_children',
        type: 'GET',
        data: { productdelivery: productdelivery },
        dataType: 'json'
      })

      .done(function(deliveries){
        var insertHTML = '';
        deliveries.forEach(function(delivery){
          insertHTML += appendOption_d(delivery);
        });
        appendDeliveryChildrenBox(insertHTML);
        $(document).on('change', '#delivery_select',function(){
          $('#form-group_children').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });

});
//ここまでセレクトボックス

//ここから画像プレビュー
$(function(){
  //ここから画像投稿
    let input_length = 0; //ファイル選択時点のimageの数を入れる
  
    function readURL(input) {
      let app_img = $(`<div class="image">
                      <img id="img_prev${input_length-1}" height="114" width="114" src="">
                      <div class="input">
                      <div class="kara"></div>
                      <input value="" type="hidden" name="product[images_attributes][${input_length-1}][_destroy]">
                      <button class="delete" type="button"></button>
                      </div>
                      </div>`);
  
      let app_input = $(`<input class="user_img" type="file" name="product[images_attributes][${input_length}][image]">`);
  
      $('.images').append(app_img);
  
      if (input.files && input.files[0]) {
        let prev = $("#img_prev" + (input_length-1))
        let reader = new FileReader();
        reader.onload = function (e) {
          $(prev).attr('src', e.target.result);
        }
        $('.new_input').prepend(app_input);
        reader.readAsDataURL(input.files[0]);
      }
    }
  
    $(document).on("change", ".user_img", function(){
      $(this).css('display', 'none');
      input_length = $(this).parent().parent().children().length; //ファイル選択時のimage数を数える
      readURL(this);
      $('.new_input').before($('.image'));
    });
  //ここまで画像投稿
  
  //ここから削除機能
    $(document).on("click", ".delete", function(){
      let delete_img = $(this).parent().parent();
      let delete_add = $(this).parent().children()[1];
  
      $(delete_img).css('display', 'none');
      $(delete_add).attr('value', "1");
    });
  //ここまで削除機能
  
  })
//ここまで画像プレビュー
