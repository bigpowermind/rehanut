// コメントが送信された時にイベント発火
$(function() {
  // テンプレートリテラル記法（バックティック文字で囲むことで、複数行文字列や文字列内挿入機能を使用できる)
  function buildHTML(comment) {
    // コメントに画像が含まれている場合で条件分岐
    if (comment.image) {
      let html = 
        `<div class="MessageBox">
          <div class="MessageInfo">
            <div class="MessageInfo__userName">
              ${comment.user_name}
            </div>
            <div class="MessageInfo__date">
              ${comment.created_at}
            </div>
          </div>
          <div class="Message">
            <p class="Message__text">
              ${comment.comment}
            </p>
            <img class="Message__image" src="${comment.image}">
          </div>
        </div>`
        return html;
    } else {
      let html =
      `<div class="MessageBox">
        <div class="MessageInfo">
          <div class="MessageInfo__userName">
            ${comment.user_name}
          </div>
          <div class="MessageInfo__date">
            ${comment.created_at}
          </div>
        </div>
        <div class="Message">
          <p class="Message__text">
            ${comment.comment}
          </p>
        </div>
      </div>`
      return html;
    };
  };
  // form要素を取得してonメソッドを使用
  $('.Form').on('submit', function(e) {
    // preventDefault()でデフォルトのイベントを止める(同期通信を止める)
    e.preventDefault();
    console.log("on")
    // FormDataはフォームのデータ送信に使用することができる(new FormData(フォーム要素)でFormDataを作成できる)
    let formData = new FormData(this);
    // フォームの送信先のurlを定義(attrメソッドは要素が持つ指定属性の値を返す。今回はイベントが発生した要素のaction属性の値を取得)
    let url = $(this).attr('action');
    console.log(url)
    // processDataオプション(デフォルトではtrueになっている。dataに指定したオブジェウトをクエリ文字列に変換する役割。)
    // contentTyapeオプション(サーバにデータのファイル形式を伝えるヘッダ。FormDataを使ってフォームの情報を取得した時には必ずfalseにする。)
    $.ajax ({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    // 非同期通信に成功した際の処理(prop('disabled', false);は、htmlの使用でsubmitボタンを一度押したらdisabled属性というボタンが押せなくなる属性が追加される。そのため、falseを記載。)
    .done(function(data) {
      console.log("非同期")
      let html = buildHTML(data);
      $('.Content__field').append(html);
      $('.Form')[0].reset();
      $('.Content__field').animate({scrollTop: $('.Content__field')[0].scrollHeight});
      $('.submit-btn').prop('disabled', false);
    })
    // エラー時の処理
    .fail(function(){
      alert("コメントの送信に失敗しました");
    });
  });
});