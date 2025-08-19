from marshmallow import Schema, fields

class ProjectSchema(Schema):
    id = fields.Int()
    title = fields.Dict(keys=fields.Str(), values=fields.Str(), required=True)
    description = fields.Dict(keys=fields.Str(), values=fields.Str(), required=True)
    link = fields.Str(allow_none=True)
    image_url = fields.Str(allow_none=True)
    sort_order = fields.Int()

class ExperienceSchema(Schema):
    id = fields.Int()
    link = fields.Str(required=True)
    title = fields.Dict(keys=fields.Str(), values=fields.Str(), required=True)
    description = fields.Dict(keys=fields.Str(), values=fields.Str(), required=True)
    date = fields.DateTime()

class TestimonySchema(Schema):
    id = fields.Int()
    name = fields.Str(required=True)
    text = fields.Str(required=True)
    link = fields.Str(required=True)
    avatar = fields.Str(required=True)

class ContactMessageSchema(Schema):
    id = fields.Int()
    name = fields.Str(required=True)
    email = fields.Str(required=True)
    message = fields.Str(required=True)
    created_at = fields.DateTime()
    status = fields.Str()
