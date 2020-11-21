class Usuario{

  String id;
  String nome;
  String senha;

  Usuario(this.id,this.nome,this.senha);

  //Converter um DOCUMENTO em um OBJETO
  Usuario.fromMap(Map<String,dynamic>map, String id){

    //Se o parâmetro id != null, então this.id = id,
    //Senão, this.id = '';
    this.id = id ?? '';
    this.nome = map['nome'];
    this.senha = map['senha'];

  }
}