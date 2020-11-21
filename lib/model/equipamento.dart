class Equipamento{

  String id;
  String nome;
  String serial;

  Equipamento(this.id,this.nome,this.serial);

  //Converter um DOCUMENTO em um OBJETO
  Equipamento.fromMap(Map<String,dynamic>map, String id){

    //Se o parâmetro id != null, então this.id = id,
    //Senão, this.id = '';
    this.id = id ?? '';
    this.nome = map['nome'];
    this.serial = map['serial'];

  }
}