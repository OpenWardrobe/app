// GENERATED CODE DO NOT EDIT
// This file should be version controlled
import 'package:brick_sqlite/db.dart';
part '20250213222641.migration.dart';
part '20250214203603.migration.dart';

/// All intelligently-generated migrations from all `@Migratable` classes on disk
final migrations = <Migration>{
  const Migration20250213222641(),
  const Migration20250214203603()
};

/// A consumable database structure including the latest generated migration.
final schema =
    Schema(20250214203603, generatorVersion: 1, tables: <SchemaTable>{
  SchemaTable('CommunityPostLike', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('post_CommunityPost_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'CommunityPost',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('user_profile_UserProfile_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'UserProfile',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('created_at', Column.datetime)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('CommunityPostComment', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('post_CommunityPost_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'CommunityPost',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('user_profile_UserProfile_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'UserProfile',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('comment', Column.varchar),
    SchemaColumn('created_at', Column.datetime)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('UseItem', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('wardrobe_item_WardrobeItem_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'WardrobeItem',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('used_at', Column.datetime),
    SchemaColumn('user_profile_UserProfile_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'UserProfile',
        onDeleteCascade: false,
        onDeleteSetDefault: false)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('_brick_Outfit_outfit_items', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('l_Outfit_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'Outfit',
        onDeleteCascade: true,
        onDeleteSetDefault: false),
    SchemaColumn('f_OutfitItem_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'OutfitItem',
        onDeleteCascade: true,
        onDeleteSetDefault: false)
  }, indices: <SchemaIndex>{
    SchemaIndex(
        columns: ['l_Outfit_brick_id', 'f_OutfitItem_brick_id'], unique: true)
  }),
  SchemaTable('Outfit', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('user_profile_UserProfile_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'UserProfile',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('name', Column.varchar),
    SchemaColumn('created_at', Column.datetime),
    SchemaColumn('updated_at', Column.datetime),
    SchemaColumn('deleted_at', Column.datetime)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('UserProfile', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('username', Column.varchar),
    SchemaColumn('display_name', Column.varchar),
    SchemaColumn('bio', Column.varchar),
    SchemaColumn('avatar_url', Column.varchar),
    SchemaColumn('social_links', Column.varchar),
    SchemaColumn('is_public', Column.boolean),
    SchemaColumn('created_at', Column.datetime),
    SchemaColumn('updated_at', Column.datetime)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('WardrobeItem', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('user_profile_UserProfile_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'UserProfile',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('brand_Brand_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'Brand',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('item_category_ItemCategory_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'ItemCategory',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('created_at', Column.datetime),
    SchemaColumn('updated_at', Column.datetime),
    SchemaColumn('deleted_at', Column.datetime),
    SchemaColumn('image_path', Column.varchar)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('UseOutfit', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('outfit_Outfit_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'Outfit',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('used_at', Column.datetime),
    SchemaColumn('user_profile_UserProfile_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'UserProfile',
        onDeleteCascade: false,
        onDeleteSetDefault: false)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('Brand', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('name', Column.varchar),
    SchemaColumn('user_profile_UserProfile_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'UserProfile',
        onDeleteCascade: false,
        onDeleteSetDefault: false)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('OutfitItem', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('outfit_Outfit_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'Outfit',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('wardrobe_item_WardrobeItem_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'WardrobeItem',
        onDeleteCascade: false,
        onDeleteSetDefault: false)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('Lookbook', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('user_profile_UserProfile_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'UserProfile',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('title', Column.varchar),
    SchemaColumn('description', Column.varchar),
    SchemaColumn('cover_image_url', Column.varchar),
    SchemaColumn('tags', Column.varchar),
    SchemaColumn('is_public', Column.boolean),
    SchemaColumn('created_at', Column.datetime),
    SchemaColumn('updated_at', Column.datetime)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('ItemMetadata', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('wardrobe_item_WardrobeItem_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'WardrobeItem',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('bought_for', Column.Double),
    SchemaColumn('currency', Column.varchar),
    SchemaColumn('purchase_date', Column.datetime),
    SchemaColumn('condition', Column.varchar),
    SchemaColumn('material', Column.varchar),
    SchemaColumn('size', Column.varchar),
    SchemaColumn('color', Column.varchar),
    SchemaColumn('notes', Column.varchar),
    SchemaColumn('created_at', Column.datetime),
    SchemaColumn('updated_at', Column.datetime)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('LookbookItem', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('lookbook_Lookbook_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'Lookbook',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('item_id', Column.varchar),
    SchemaColumn('item_type', Column.varchar),
    SchemaColumn('created_at', Column.datetime)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('ItemCategory', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('name', Column.varchar)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('CommunityPost', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('user_profile_UserProfile_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'UserProfile',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('content', Column.varchar),
    SchemaColumn('image_url', Column.varchar),
    SchemaColumn('is_public', Column.boolean),
    SchemaColumn('created_at', Column.datetime),
    SchemaColumn('updated_at', Column.datetime)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  })
});
