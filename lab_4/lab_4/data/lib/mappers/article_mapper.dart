import 'package:data/entities/api/article_api_dto.dart';
import 'package:domain/models/article.dart';

class ArticleMapper {

  Article mapApiDtoToModel(ArticleApiDto article){
    return Article(article.id,
        Author(article.author.id, article.author.modified_at, article.author.created_at, article.author.name, article.author.avatar),
        Category(article.category.id, article.category.modified_at, article.category.created_at, article.category.title),
        article.tags, article.description, article.content, article.image, article.views_count, article.is_featured);
  }
}
