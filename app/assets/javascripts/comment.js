// コメントが送信された時にイベント発火
$(function() {
  // form要素を取得してonメソッドを使用
  $("#new_comment").on('submit', function(e) {
    // preventDefault()でデフォルトのイベントを止める(同期通信を止める)
    e.preventDefault();
    // FormDataはフォームのデータ送信に使用することができる(new FormData(フォーム要素)でFormDataを作成できる)
    let formData = new FormData(this);
    // フォームの送信先のurlを定義(attrメソッドは要素が持つ指定属性の値を返す。今回はイベントが発生した要素のaction属性の値を取得)
    let url = $(this).attr('action')
    // processDataオプション(デフォルトではtrueになっている。dataに指定したオブジェウトをクエリ文字列に変換する役割。)
    // contentTyapeオプション(サーバにデータのファイル形式を伝えるヘッダ。FormDataを使ってフォームの情報を取得した時には必ずfalseにする。)
    $.ajax ({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    });
  });
});