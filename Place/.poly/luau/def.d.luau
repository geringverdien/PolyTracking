declare json: {
    parse: ((string?) -> any),
    serialize: ((any?) -> string),
    null: (() -> string),
    isNull: ((string?) -> boolean),
}

declare guid: {
    new: (() -> string),
    empty: (() -> string),
}

declare _POLY_VERSION: string

declare _POLY_2: boolean

declare _LOCALTEST: boolean

declare function warn(message: string)

declare function wait(seconds: number?)

declare function spawn(callback: () -> ())

declare function tick(): number

declare function time(): number

declare function require(moduleScript: (ModuleScript)): any

declare function pcall(f: (...any) -> (boolean, any))

declare world: World

declare script: Script

declare Environment: Environment

declare Lighting: Lighting

declare Players: Players

declare ScriptService: ScriptService

declare Hidden: Hidden

declare ServerHidden: ServerHidden

declare PlayerDefaults: PlayerDefaults

declare PlayerGUI: PlayerGUI

declare Chat: ChatService

declare Filter: FilterService

declare Camera: Camera

declare Assets: AssetsService

declare Input: InputService

declare Achievements: AchievementsService

declare Tween: TweenService

declare CoreUI: CoreUIService

declare Stats: Stats

declare Teams: Teams

declare Datastore: DatastoreService

declare Http: HttpService

declare Insert: InsertService

declare Purchases: PurchasesService

declare Capture: CaptureService

declare Presence: PresenceService

declare Creator: CreatorService

declare CreatorContext: CreatorContextService

declare IO: IOService

declare Addons: CreatorAddons

declare Selections: CreatorSelections

declare History: CreatorHistory

declare CreatorGUI: CreatorGUI

declare Preferences: PreferencesService

declare Hooks: HookService

declare class PTSignalConnection
	function Disconnect(self): ()
end

export type PTSignal<T... = ...any> = {
	Connect: (self: PTSignal<T...>, callback: (T...) -> ()) -> PTSignalConnection,
	Disconnect: (self: PTSignal<T...>, callback: (T...) -> ()) -> nil,
	Once: (self: PTSignal<T...>, callback: (T...) -> ()) -> PTSignalConnection,
	Wait: (self: PTSignal<T...>) -> T...,
}

declare class Enum end
declare class CameraMode end
declare class CameraModeEnum extends Enum
	Follow:CameraMode
	Free:CameraMode
	Scripted:CameraMode
end
declare class CharacterModelState end
declare class CharacterModelStateEnum extends Enum
	Idle:CharacterModelState
	Walking:CharacterModelState
	Running:CharacterModelState
	Jumping:CharacterModelState
	Climbing:CharacterModelState
end
declare class CharacterAttachment end
declare class CharacterAttachmentEnum extends Enum
	Head:CharacterAttachment
	UpperTorso:CharacterAttachment
	LowerTorso:CharacterAttachment
	ShoulderLeft:CharacterAttachment
	ShoulderRight:CharacterAttachment
	ElbowLeft:CharacterAttachment
	ElbowRight:CharacterAttachment
	HandLeft:CharacterAttachment
	HandRight:CharacterAttachment
	LegLeft:CharacterAttachment
	LegRight:CharacterAttachment
	KneeLeft:CharacterAttachment
	KneeRight:CharacterAttachment
	FootLeft:CharacterAttachment
	FootRight:CharacterAttachment
end
declare class HttpRequestMethod end
declare class HttpRequestMethodEnum extends Enum
	Get:HttpRequestMethod
	Post:HttpRequestMethod
	Put:HttpRequestMethod
	Delete:HttpRequestMethod
	Patch:HttpRequestMethod
end
declare class GrabbablePermissionMode end
declare class GrabbablePermissionModeEnum extends Enum
	None:GrabbablePermissionMode
	Everyone:GrabbablePermissionMode
	Scripted:GrabbablePermissionMode
end
declare class UIMode end
declare class UIModeEnum extends Enum
	Default:UIMode
	GUI3D:UIMode
end
declare class SkyboxPreset end
declare class SkyboxEnum extends Enum
	Day1:SkyboxPreset
	Day2:SkyboxPreset
	Day3:SkyboxPreset
	Day4:SkyboxPreset
	Day5:SkyboxPreset
	Day6:SkyboxPreset
	Day7:SkyboxPreset
	Morning1:SkyboxPreset
	Morning2:SkyboxPreset
	Morning3:SkyboxPreset
	Morning4:SkyboxPreset
	Night1:SkyboxPreset
	Night2:SkyboxPreset
	Night3:SkyboxPreset
	Night4:SkyboxPreset
	Night5:SkyboxPreset
	Sunset1:SkyboxPreset
	Sunset2:SkyboxPreset
	Sunset3:SkyboxPreset
	Sunset4:SkyboxPreset
	Sunset5:SkyboxPreset
end
declare class AmbientSource end
declare class AmbientSourceEnum extends Enum
	Skybox:AmbientSource
	Color:AmbientSource
end
declare class MeshCollisionType end
declare class CollisionTypeEnum extends Enum
	Bounds:MeshCollisionType
	Convex:MeshCollisionType
	Exact:MeshCollisionType
end
declare class PartShape end
declare class ShapeEnum extends Enum
	Brick:PartShape
	Sphere:PartShape
	Cylinder:PartShape
	Cone:PartShape
	Wedge:PartShape
	Corner:PartShape
	Bevel:PartShape
	Concave:PartShape
	Truss:PartShape
	Frame:PartShape
	Octant:PartShape
	Torus:PartShape
	BeveledCorner:PartShape
	ConcaveCorner:PartShape
	TriangleCorner:PartShape
	TriangleConcaveCorner:PartShape
end
declare class PartMaterial end
declare class PartMaterialEnum extends Enum
	SmoothPlastic:PartMaterial
	Brick:PartMaterial
	Concrete:PartMaterial
	Dirt:PartMaterial
	Fabric:PartMaterial
	Grass:PartMaterial
	Ice:PartMaterial
	Marble:PartMaterial
	Metal:PartMaterial
	MetalGrid:PartMaterial
	MetalPlate:PartMaterial
	Neon:PartMaterial
	Planks:PartMaterial
	Plastic:PartMaterial
	Plywood:PartMaterial
	RustyIron:PartMaterial
	Sand:PartMaterial
	Sandstone:PartMaterial
	Snow:PartMaterial
	Stone:PartMaterial
	Wood:PartMaterial
end
declare class ParticleSimulationSpace end
declare class ParticleSimulationSpaceEnum extends Enum
	Local:ParticleSimulationSpace
	World:ParticleSimulationSpace
end
declare class ParticleEmissionShape end
declare class ParticleEmissionShapeEnum extends Enum
	Point:ParticleEmissionShape
	Sphere:ParticleEmissionShape
	SphereSurface:ParticleEmissionShape
	Box:ParticleEmissionShape
	Ring:ParticleEmissionShape
end
declare class ParticleOrientation end
declare class ParticleOrientationEnum extends Enum
	FaceCamera:ParticleOrientation
	FaceCameraFixedY:ParticleOrientation
end
declare class ForceMode end
declare class ForceModeEnum extends Enum
	Force:ForceMode
	Acceleration:ForceMode
	Impulse:ForceMode
	VelocityChange:ForceMode
end
declare class PlayerMovementMode end
declare class PlayerMovementModeEnum extends Enum
	Default:PlayerMovementMode
	Scripted:PlayerMovementMode
end
declare class PlayerRotationMode end
declare class PlayerRotationModeEnum extends Enum
	Automatic:PlayerRotationMode
	CameraLocked:PlayerRotationMode
	Movement:PlayerRotationMode
	MovementCtrlLockOnly:PlayerRotationMode
end
declare class BuiltInAudioPreset end
declare class BuiltInAudioPresetEnum extends Enum
	Jump:BuiltInAudioPreset
	Explosion:BuiltInAudioPreset
end
declare class FontPreset end
declare class BuiltInTextFontPresetEnum extends Enum
	SourceSans:FontPreset
	PressStart2P:FontPreset
	Montserrat:FontPreset
	RobotoMono:FontPreset
	Rubik:FontPreset
	Poppins:FontPreset
	Domine:FontPreset
	Fredoka:FontPreset
	ComicNeue:FontPreset
	Orbitron:FontPreset
	Papyrus:FontPreset
	ComicSansMS:FontPreset
	JetBrainsMono:FontPreset
end
declare class GradientImageFill end
declare class GradientImageFillEnum extends Enum
	Linear:GradientImageFill
	Radial:GradientImageFill
	Square:GradientImageFill
end
declare class MeshAnimationType end
declare class MeshAnimationTypeEnum extends Enum
	Normal:MeshAnimationType
	Looped:MeshAnimationType
	PingPong:MeshAnimationType
	OneShot:MeshAnimationType
	OneShotImpluse:MeshAnimationType
end
declare class ImageType end
declare class ImageTypeEnum extends Enum
	Asset:ImageType
	AssetThumbnail:ImageType
	WorldThumbnail:ImageType
	UserAvatar:ImageType
	UserAvatarHeadshot:ImageType
	GuildIcon:ImageType
	GuildBanner:ImageType
	PlaceIcon:ImageType
end
declare class CtrlLockCursor end
declare class CtrlLockCursorEnum extends Enum
	None:CtrlLockCursor
	Chevron:CtrlLockCursor
	Stereotypical:CtrlLockCursor
	StereotypicalDot:CtrlLockCursor
	Tactical:CtrlLockCursor
	Dot:CtrlLockCursor
	TacticalDot:CtrlLockCursor
	Plus:CtrlLockCursor
	X:CtrlLockCursor
end
declare class ClientPlatform end
declare class ClientPlatformEnum extends Enum
	Desktop:ClientPlatform
	Mobile:ClientPlatform
	VR:ClientPlatform
end
declare class TweenTransition end
declare class TweenTransitionEnum extends Enum
	Linear:TweenTransition
	Sine:TweenTransition
	Quint:TweenTransition
	Quart:TweenTransition
	Quad:TweenTransition
	Expo:TweenTransition
	Elastic:TweenTransition
	Cubic:TweenTransition
	Circ:TweenTransition
	Bounce:TweenTransition
	Back:TweenTransition
	Spring:TweenTransition
end
declare class TweenDirection end
declare class TweenDirectionEnum extends Enum
	In:TweenDirection
	Out:TweenDirection
	InOut:TweenDirection
	OutIn:TweenDirection
end
declare class DominantAxis end
declare class DominantAxisEnum extends Enum
	Width:DominantAxis
	Height:DominantAxis
end
declare class AspectRatioScaleType end
declare class AspectRatioScaleTypeEnum extends Enum
	FitContainer:AspectRatioScaleType
	FitMaxSize:AspectRatioScaleType
	NoLimit:AspectRatioScaleType
end
declare class UIMaskMode end
declare class MaskModeEnum extends Enum
	Disabled:UIMaskMode
	ClipOnly:UIMaskMode
	ClipAndDraw:UIMaskMode
end
declare class UILayoutAlignment end
declare class UILayoutAlignmentEnum extends Enum
	Start:UILayoutAlignment
	Center:UILayoutAlignment
	End:UILayoutAlignment
end
declare class ImageStretchMode end
declare class ImageStretchModeEnum extends Enum
	Stretch:ImageStretchMode
	Centered:ImageStretchMode
	Covered:ImageStretchMode
end
declare class UIScrollMode end
declare class ScrollModeEnum extends Enum
	Disabled:UIScrollMode
	Auto:UIScrollMode
	AlwaysShow:UIScrollMode
	NeverShow:UIScrollMode
end
declare class BorderMode end
declare class BorderModeEnum extends Enum
	Inset:BorderMode
	Middle:BorderMode
	Outline:BorderMode
end
declare class FontWeight end
declare class FontWeightEnum extends Enum
	Thin:FontWeight
	ExtraLight:FontWeight
	Light:FontWeight
	Regular:FontWeight
	Medium:FontWeight
	SemiBold:FontWeight
	Bold:FontWeight
	ExtraBold:FontWeight
	Black:FontWeight
end
declare class FontStyle end
declare class FontStyleEnum extends Enum
	Normal:FontStyle
	Italic:FontStyle
end
declare class KeyCode end
declare class KeyCodeEnum extends Enum
	None:KeyCode
	Space:KeyCode
	Exclam:KeyCode
	QuotedBl:KeyCode
	Numbersign:KeyCode
	Dollar:KeyCode
	Percent:KeyCode
	Ampersand:KeyCode
	Apostrophe:KeyCode
	ParenLeft:KeyCode
	Parenright:KeyCode
	Asterisk:KeyCode
	Plus:KeyCode
	Comma:KeyCode
	Minus:KeyCode
	Period:KeyCode
	Slash:KeyCode
	Key0:KeyCode
	Key1:KeyCode
	Key2:KeyCode
	Key3:KeyCode
	Key4:KeyCode
	Key5:KeyCode
	Key6:KeyCode
	Key7:KeyCode
	Key8:KeyCode
	Key9:KeyCode
	Colon:KeyCode
	Semicolon:KeyCode
	Less:KeyCode
	Equal:KeyCode
	Greater:KeyCode
	Question:KeyCode
	At:KeyCode
	A:KeyCode
	B:KeyCode
	C:KeyCode
	D:KeyCode
	E:KeyCode
	F:KeyCode
	G:KeyCode
	H:KeyCode
	I:KeyCode
	J:KeyCode
	K:KeyCode
	L:KeyCode
	M:KeyCode
	N:KeyCode
	O:KeyCode
	P:KeyCode
	Q:KeyCode
	R:KeyCode
	S:KeyCode
	T:KeyCode
	U:KeyCode
	V:KeyCode
	W:KeyCode
	X:KeyCode
	Y:KeyCode
	Z:KeyCode
	BracketLeft:KeyCode
	Backslash:KeyCode
	BracketRight:KeyCode
	Asciicircum:KeyCode
	Underscore:KeyCode
	QuoteLeft:KeyCode
	BraceLeft:KeyCode
	Bar:KeyCode
	BraceRight:KeyCode
	Asciitilde:KeyCode
	Yen:KeyCode
	Section:KeyCode
	GamepadA:KeyCode
	GamepadB:KeyCode
	GamepadX:KeyCode
	GamepadY:KeyCode
	GamepadBack:KeyCode
	GamepadGuide:KeyCode
	GamepadStart:KeyCode
	GamepadLeftStick:KeyCode
	GamepadRightStick:KeyCode
	GamepadLeftShoulder:KeyCode
	GamepadRightShoulder:KeyCode
	GamepadDpadUp:KeyCode
	GamepadDpadDown:KeyCode
	GamepadDpadLeft:KeyCode
	GamepadDpadRight:KeyCode
	GamepadPaddle1:KeyCode
	GamepadPaddle2:KeyCode
	GamepadPaddle3:KeyCode
	GamepadPaddle4:KeyCode
	GamepadTouchpad:KeyCode
	MouseLeft:KeyCode
	MouseRight:KeyCode
	MouseMiddle:KeyCode
	MouseWheelUp:KeyCode
	MouseWheelDown:KeyCode
	MouseWheelLeft:KeyCode
	MouseWheelRight:KeyCode
	MouseXbutton1:KeyCode
	MouseXbutton2:KeyCode
	GamepadAxisLeftX:KeyCode
	GamepadAxisLeftY:KeyCode
	GamepadAxisRightX:KeyCode
	GamepadAxisRightY:KeyCode
	GamepadAxisTriggerLeft:KeyCode
	GamepadAxisTriggerRight:KeyCode
	MouseAxisX:KeyCode
	MouseAxisY:KeyCode
	Special:KeyCode
	Escape:KeyCode
	Tab:KeyCode
	Backtab:KeyCode
	Backspace:KeyCode
	Enter:KeyCode
	KpEnter:KeyCode
	Insert:KeyCode
	Delete:KeyCode
	Left:KeyCode
	Up:KeyCode
	Right:KeyCode
	Down:KeyCode
	PageUp:KeyCode
	PageDown:KeyCode
	Shift:KeyCode
	Ctrl:KeyCode
	Meta:KeyCode
	Alt:KeyCode
	CapsLock:KeyCode
	NumLock:KeyCode
	ScrollLock:KeyCode
	F1:KeyCode
	F2:KeyCode
	F3:KeyCode
	F4:KeyCode
	F5:KeyCode
	F6:KeyCode
	F7:KeyCode
	F8:KeyCode
	F9:KeyCode
	F10:KeyCode
	F11:KeyCode
	F12:KeyCode
	Menu:KeyCode
	Hyper:KeyCode
	KpMultiply:KeyCode
	KpDivide:KeyCode
	KpSubtract:KeyCode
	KpPeriod:KeyCode
	KpAdd:KeyCode
	Kp0:KeyCode
	Kp1:KeyCode
	Kp2:KeyCode
	Kp3:KeyCode
	Kp4:KeyCode
	Kp5:KeyCode
	Kp6:KeyCode
	Kp7:KeyCode
	Kp8:KeyCode
	Kp9:KeyCode
	Unknown:KeyCode
end
declare class BlendMode end
declare class BlendModeEnum extends Enum
	Mix:BlendMode
	Add:BlendMode
	Subtract:BlendMode
	Multiply:BlendMode
end
declare class GraphicsPreset end
declare class GraphicsPresetEnum extends Enum
	Low:GraphicsPreset
	Medium:GraphicsPreset
	High:GraphicsPreset
	Ultra:GraphicsPreset
	Photo:GraphicsPreset
	Custom:GraphicsPreset
end
declare class RenderingMethod end
declare class RenderingMethodEnum extends Enum
	Standard:RenderingMethod
	Performance:RenderingMethod
	Compatibility:RenderingMethod
	Auto:RenderingMethod
end
declare class ShadowQuality end
declare class ShadowQualityEnum extends Enum
	Off:ShadowQuality
	Low:ShadowQuality
	Medium:ShadowQuality
	High:ShadowQuality
	Ultra:ShadowQuality
end
declare class MsaaScale end
declare class MsaaScaleEnum extends Enum
	Disabled:MsaaScale
	X2:MsaaScale
	X4:MsaaScale
	X8:MsaaScale
end
declare class SoundAttenuationMode end
declare class SoundAttenuationModeEnum extends Enum
	Disabled:SoundAttenuationMode
	Linear:SoundAttenuationMode
	Squared:SoundAttenuationMode
	Logarithmic:SoundAttenuationMode
end
declare class HorizontalAlignment end
declare class TextHorizontalAlignmentEnum extends Enum
	Left:HorizontalAlignment
	Center:HorizontalAlignment
	Right:HorizontalAlignment
end
declare class VerticalAlignment end
declare class TextVerticalAlignmentEnum extends Enum
	Top:VerticalAlignment
	Middle:VerticalAlignment
	Bottom:VerticalAlignment
end
declare class TextTrimming end
declare class TextTrimmingEnum extends Enum
	None:TextTrimming
	Character:TextTrimming
	Word:TextTrimming
	CharacterEllipsis:TextTrimming
	WordEllipsis:TextTrimming
end
declare class TextureFilter end
declare class TextureFilterEnum extends Enum
	Nearest:TextureFilter
	NearestNoMipmaps:TextureFilter
	Linear:TextureFilter
	LinearNoMipmaps:TextureFilter
end
declare class AddonPermission end
declare class AddonPermissionEnum extends Enum
	IORead:AddonPermission
	IOWrite:AddonPermission
end
declare class CreatorToolMode end
declare class ToolModeEnum extends Enum
	Select:CreatorToolMode
	Move:CreatorToolMode
	Rotate:CreatorToolMode
	Scale:CreatorToolMode
	Paint:CreatorToolMode
	Brush:CreatorToolMode
end
type ENUM_LIST = {
	CameraMode:CameraModeEnum,
	CharacterModelState:CharacterModelStateEnum,
	CharacterAttachment:CharacterAttachmentEnum,
	HttpRequestMethod:HttpRequestMethodEnum,
	GrabbablePermissionMode:GrabbablePermissionModeEnum,
	UIMode:UIModeEnum,
	SkyboxPreset:SkyboxEnum,
	AmbientSource:AmbientSourceEnum,
	MeshCollisionType:CollisionTypeEnum,
	PartShape:ShapeEnum,
	PartMaterial:PartMaterialEnum,
	ParticleSimulationSpace:ParticleSimulationSpaceEnum,
	ParticleEmissionShape:ParticleEmissionShapeEnum,
	ParticleOrientation:ParticleOrientationEnum,
	ForceMode:ForceModeEnum,
	PlayerMovementMode:PlayerMovementModeEnum,
	PlayerRotationMode:PlayerRotationModeEnum,
	BuiltInAudioPreset:BuiltInAudioPresetEnum,
	FontPreset:BuiltInTextFontPresetEnum,
	GradientImageFill:GradientImageFillEnum,
	MeshAnimationType:MeshAnimationTypeEnum,
	ImageType:ImageTypeEnum,
	CtrlLockCursor:CtrlLockCursorEnum,
	ClientPlatform:ClientPlatformEnum,
	TweenTransition:TweenTransitionEnum,
	TweenDirection:TweenDirectionEnum,
	DominantAxis:DominantAxisEnum,
	AspectRatioScaleType:AspectRatioScaleTypeEnum,
	UIMaskMode:MaskModeEnum,
	UILayoutAlignment:UILayoutAlignmentEnum,
	ImageStretchMode:ImageStretchModeEnum,
	UIScrollMode:ScrollModeEnum,
	BorderMode:BorderModeEnum,
	FontWeight:FontWeightEnum,
	FontStyle:FontStyleEnum,
	KeyCode:KeyCodeEnum,
	BlendMode:BlendModeEnum,
	GraphicsPreset:GraphicsPresetEnum,
	RenderingMethod:RenderingMethodEnum,
	ShadowQuality:ShadowQualityEnum,
	MsaaScale:MsaaScaleEnum,
	SoundAttenuationMode:SoundAttenuationModeEnum,
	HorizontalAlignment:TextHorizontalAlignmentEnum,
	VerticalAlignment:TextVerticalAlignmentEnum,
	TextTrimming:TextTrimmingEnum,
	TextureFilter:TextureFilterEnum,
	AddonPermission:AddonPermissionEnum,
	CreatorToolMode:ToolModeEnum,
} & { }
declare Enums: ENUM_LIST
declare class NetworkedObject
	Name : string
	ClassName : string
	Shared : ScriptSharedTable
	NetworkedObjectID : string
	ObjectID : string
	ExistInNetwork : boolean
	PropertyChanged : PTSignal<string>
	Renamed : PTSignal
	TreeEntered : PTSignal
	TreeExited : PTSignal
	Destroying : PTSignal
	function IsA(self, className: string): boolean
	function Clone(self, parent: NetworkedObject?): NetworkedObject
	function Destroy(self, time: number?): nil
	function Delete(self, time: number?): nil
	function __tostring(self, obj: NetworkedObject): string
	function __eq(self, a: any, b: any): boolean
end

declare class Instance extends NetworkedObject
	Parent : Instance
	EditableChildren : boolean
	Tags : { string }
	Archivable : boolean
	ChildAdded : PTSignal<Instance>
	ChildRemoved : PTSignal<Instance>
	ChildDeleting : PTSignal<Instance>
	ChildDeleted : PTSignal<Instance>
	TagAdded : PTSignal<string>
	TagRemoved : PTSignal<string>
	function GetDescendants(self): { Instance }
	function FindChild(self, name: string): Instance
	function WaitChild(self, name: string, timeoutSec: number?): Instance
	function FindChildByClass(self, className: string): Instance
	function FindChildWithTag(self, tag: string): Instance
	function FindDescendant(self, path: string): Instance
	function GetChildrenWithTag(self, tag: string): { Instance }
	function GetDescendantsWithTag(self, tag: string): { Instance }
	function FindAncestorByClass(self, className: string): Instance
	function FindChildByIndex(self, index: number): Instance
	function MoveChild(self, child: Instance, index: number): nil
	function GetChildren(self): { Instance }
	function GetChildrenOfClass(self, className: string): { Instance }
	function IsAncestorOf(self, instance: Instance): boolean
	function IsDescendantOf(self, instance: Instance): boolean
	function IsDescendantOfClass(self, className: string): boolean
	function AddTag(self, tag: string): nil
	function RemoveTag(self, tag: string): nil
	function HasTag(self, tag: string): boolean
	function Reparent(self, to: Instance): nil
	function GetParent(self): Instance
	function SetParent(self, newParent: Instance): nil
	function __index(self, indexer: any): any
	function __newindex(self, indexer: any): nil
end
declare Instance: {
New: (string, Instance?) -> (Instance),
}


declare class World extends Instance
	IsLocalTest : boolean
	IsLegacyWorld : boolean
	WorldID : number
	ServerID : number
	UpTime : number
	ServerTime : number
	InstanceCount : number
	Rendered : PTSignal<number>
	function GetNetworkedObject(self, networkID: string): NetworkedObject
	function GetFPS(self): number
end

declare class Script extends Instance
	Source : string
	IsEnabled : boolean
	LinkedScript : FileLinkAsset
	Compatibility : boolean
	function Call(self, funcName: string, args: any): nil
	function CallAsync(self, funcName: string, args: any): nil
	function LinkWithScriptFile(self, scriptPath: string): nil
end

declare class ModuleScript extends Script
end
declare ModuleScript: {
New: (NetworkedObject?) -> (ModuleScript),
}


declare class ClientScript extends Script
end
declare ClientScript: {
New: (NetworkedObject?) -> (ClientScript),
}


declare class ServerScript extends Script
end
declare ServerScript: {
New: (NetworkedObject?) -> (ServerScript),
}


declare class Dynamic extends Instance
	Position : Vector3
	Rotation : Vector3
	Size : Vector3
	LocalPosition : Vector3
	LocalRotation : Vector3
	LocalSize : Vector3
	Quaternion : Quaternion
	LocalQuaternion : Quaternion
	Locked : boolean
	Forward : Vector3
	Right : Vector3
	Up : Vector3
	function LookAt(self, target: any): nil
	function LookAt(self, target: any, up: Vector3): nil
	function Translate(self, translation: Vector3): nil
	function RotateAround(self, point: Vector3, axis: Vector3, angle: number): nil
	function Rotate(self, eulerAngles: Vector3): nil
	function GetBounds(self): Bounds
end
declare Dynamic: {
New: (NetworkedObject?) -> (Dynamic),
}


declare class Physical extends Dynamic
	Anchored : boolean
	CanCollide : boolean
	CollisionLayers : number
	CollisionMask : number
	Velocity : Vector3
	AngularVelocity : Vector3
	RayPassthrough : number
	Touched : PTSignal<Physical>
	TouchEnded : PTSignal<Physical>
	MouseEnter : PTSignal
	MouseExit : PTSignal
	Clicked : PTSignal<Player>
	function SetNetworkAuthority(self, plr: Player): nil
	function SetCollisionLayer(self, layer: number, value: boolean): nil
	function SetCollisionMask(self, layer: number, value: boolean): nil
	function GetCollisionLayer(self, layer: number): boolean
	function GetCollisionMask(self, layer: number): boolean
	function GetTouching(self): { Physical }
	function MovePosition(self, position: Vector3): nil
	function MoveRotation(self, rotation: Vector3): nil
	function AddForce(self, force: Vector3, mode: ForceMode?): nil
	function AddTorque(self, force: Vector3, mode: ForceMode?): nil
	function AddForceAtPosition(self, force: Vector3, position: Vector3, mode: ForceMode?): nil
	function AddRelativeForce(self, force: Vector3, mode: ForceMode?): nil
	function AddRelativeTorque(self, torque: Vector3, mode: ForceMode?): nil
end

declare class RigidBody extends Physical
	Velocity : Vector3
	AngularVelocity : Vector3
	GravityScale : number
	Mass : number
	Friction : number
	Drag : number
	AngularDrag : number
	Bounciness : number
	LockRotation : boolean
end
declare RigidBody: {
New: (NetworkedObject?) -> (RigidBody),
}


declare class Entity extends RigidBody
	Color : Color
	CastShadows : boolean
	IsSpawn : boolean
end

declare class Part extends Entity
	Shape : PartShape
	Material : PartMaterial
	Color : Color
	CastShadows : boolean
end
declare Part: {
New: (NetworkedObject?) -> (Part),
}


declare class Seat extends Part
	Occupant : NPC
	CanPlayerSit : boolean
	CanNPCSit : boolean
	SitDirectionLocked : boolean
	Sat : PTSignal<NPC>
	Vacated : PTSignal<NPC>
end
declare Seat: {
New: (NetworkedObject?) -> (Seat),
}


declare class Truss extends Part
	ClimbSpeed : number
	Climbable : boolean
end
declare Truss: {
New: (NetworkedObject?) -> (Truss),
}


declare class Mesh extends Entity
	Asset : MeshAsset
	IncludeOffset : boolean
	CollisionType : MeshCollisionType
	TextureFilter : TextureFilter
	PlayAnimationOnStart : boolean
	UsePartColor : boolean
	Color : Color
	CastShadows : boolean
	CurrentAnimation : string
	IsAnimationPlaying : boolean
	Loading : boolean
	Loaded : PTSignal
	function PlayAnimation(self, animationName: string, speed: number?, loop: boolean?): nil
	function StopAnimation(self, animationName: string?): nil
	function GetAnimations(self): { string }
	function GetAnimationInfo(self): { MeshAnimationInfo }
end
declare Mesh: {
New: (NetworkedObject?) -> (Mesh),
}


declare class Tool extends RigidBody
	Droppable : boolean
	IconImage : ImageAsset
	DropEquipCooldown : number
	Holder : NPC
	Equipped : PTSignal
	Unequipped : PTSignal
	Activated : PTSignal
	Deactivated : PTSignal
	function Activate(self): nil
	function Deactivate(self): nil
	function PlayAnimation(self, animationName: string): nil
end
declare Tool: {
New: (NetworkedObject?) -> (Tool),
}


declare class NPC extends Physical
	Velocity : Vector3
	SeatOffset : Vector3
	Health : number
	MaxHealth : number
	JumpPower : number
	WalkSpeed : number
	UseNametag : boolean
	NametagOffset : Vector3
	NametagVisibleRadius : number
	DisplayName : string
	JumpSound : Sound
	IsSitting : boolean
	IsDead : boolean
	HoldingTool : Tool
	SittingIn : Seat
	Character : CharacterModel
	Vertical : Vector3
	MoveTarget : Dynamic
	IsOnGround : boolean
	IsOnCeiling : boolean
	NavDestinationDistance : number
	NavDestinationReached : boolean
	NavDestinationValid : boolean
	Died : PTSignal
	HealthChanged : PTSignal<number, number>
	Jumped : PTSignal
	LeftGround : PTSignal
	Seated : PTSignal<Seat>
	Unseated : PTSignal<Seat>
	Landed : PTSignal
	NavFinished : PTSignal
	function Move(self, velo: Vector3): nil
	function Kill(self): nil
	function TryStepUp(self): boolean
	function Jump(self): nil
	function Sit(self, seat: Seat): nil
	function Unsit(self, addForce: boolean?): nil
	function EquipTool(self, tool: Tool): nil
	function DropTool(self): nil
	function LoadAppearance(self, userID: number): nil
	function ClearAppearance(self): nil
	function SetNavDestination(self, pos: Vector3): nil
	function Respawn(self): nil
	function TakeDamage(self, dmg: number): nil
	function Heal(self, amount: number): nil
end
declare NPC: {
New: (NetworkedObject?) -> (NPC),
}


declare class Player extends NPC
	UserID : number
	CanMove : boolean
	SprintSpeed : number
	Stamina : number
	MaxStamina : number
	UseStamina : boolean
	StaminaRegen : number
	StaminaBurn : number
	RespawnTime : number
	KeepInventory : boolean
	UseHeadTurning : boolean
	UseBubbleChat : boolean
	AutoLoadAppearance : boolean
	AllowAnimationWhileMoving : boolean
	Team : Team
	MovementMode : PlayerMovementMode
	RotationMode : PlayerRotationMode
	Grabbing : Physical
	NetworkPing : number
	IsAdmin : boolean
	IsCreator : boolean
	UserRoleClass : string
	ChatColor : Color
	IsLocal : boolean
	IsClimbing : boolean
	ClimbingTruss : Truss
	UserPlatform : ClientPlatform
	Inventory : Inventory
	Chatted : PTSignal<string>
	StatChanged : PTSignal<Stat, any>
	TeamChanged : PTSignal<Team>
	Respawned : PTSignal
	Grabbed : PTSignal<Physical>
	Ungrabbed : PTSignal<Physical>
	function Jump(self): nil
	function Kick(self, reason: string): nil
	function UnequipTool(self): nil
	function Respawn(self): nil
	function ResetAppearance(self): nil
end

declare class InteractionPrompt extends Physical
	UIMode : UIMode
	Enabled : boolean
	HideByDefault : boolean
	Title : string
	Subtitle : string
	Scale : number
	MaxDistance : number
	LineOfSightThreshold : number
	ActivationTime : number
	UseParentForVisibility : boolean
	RequireFacing : boolean
	HiddenFor : { Player }
	Progress : number
	Interacted : PTSignal<Player>
	function HideFor(self, plr: Player): nil
	function ShowFor(self, plr: Player): nil
end
declare InteractionPrompt: {
New: (NetworkedObject?) -> (InteractionPrompt),
}


declare class CharacterModel extends Dynamic
	CurrentState : CharacterModelState
	CurrentSpeed : number
	Animator : Animator
	function PlayIdle(self): nil
	function PlayWalk(self): nil
	function PlayRun(self): nil
	function PlayJump(self): nil
	function PlayClimb(self): nil
	function SetAnimSpeed(self, speed: number): nil
	function SetState(self, newState: CharacterModelState): nil
	function GetAttachment(self, attachmentEnum: CharacterAttachment): Dynamic
end
declare CharacterModel: {
New: (NetworkedObject?) -> (CharacterModel),
}


declare class PolytorianModel extends CharacterModel
	HeadColor : Color
	TorsoColor : Color
	LeftArmColor : Color
	RightArmColor : Color
	LeftLegColor : Color
	RightLegColor : Color
	FaceImage : ImageAsset
	BodyMesh : MeshAsset
	Ragdolling : boolean
	RagdollPosition : Vector3
	RagdollRotation : Vector3
	RagdollStarted : PTSignal
	RagdollStopped : PTSignal
	function StartRagdoll(self, force: Vector3?): nil
	function StopRagdoll(self): nil
	function GetAttachment(self, attachmentEnum: CharacterAttachment): Dynamic
	function LoadAppearance(self, userID: number, loadTool: boolean?): nil
	function ClearAppearance(self): nil
end
declare PolytorianModel: {
New: (NetworkedObject?) -> (PolytorianModel),
}


declare class Camera extends Dynamic
	Forward : Vector3
	Mode : CameraMode
	FOV : number
	ClipThroughWalls : boolean
	MinDistance : number
	MaxDistance : number
	Distance : number
	ScrollSensitivity : number
	Orthographic : boolean
	FollowLerp : boolean
	LerpSpeed : number
	OrthographicSize : number
	Near : number
	Far : number
	PositionOffset : Vector3
	QuaternionOffset : Quaternion
	RotationOffset : Vector3
	IsFirstPerson : boolean
	CanLock : boolean
	SensitivityMultiplier : number
	Sensitivity : number
	HorizontalSpeed : number
	VerticalSpeed : number
	ScrollLerpSpeed : number
	CtrlLocked : boolean
	AlwaysLocked : boolean
	Target : Dynamic
	FirstPersonEntered : PTSignal
	FirstPersonExited : PTSignal
	function IsPositionInView(self, pos: Vector3): boolean
	function IsPositionBehind(self, pos: Vector3): boolean
	function ViewportPointToRay(self, pos: Vector2, ignoreList: { Instance }?, maxDistance: number?, passthroughMask: number?): RayResult
	function ScreenPointToRay(self, pos: Vector2, ignoreList: { Instance }?, maxDistance: number?, passthroughMask: number?): RayResult
	function ViewportToScreenPoint(self, pos: Vector2): Vector2
	function ViewportToWorldPoint(self, pos: Vector2): Vector3
	function WorldToViewportPoint(self, pos: Vector3): Vector2
	function WorldToScreenPoint(self, pos: Vector3): Vector2
	function ScreenToViewportPoint(self, pos: Vector2): Vector2
	function ScreenToWorldPoint(self, pos: Vector2): Vector3
end
declare Camera: {
New: (NetworkedObject?) -> (Camera),
}


declare class Light extends Dynamic
	Enabled : boolean
	Color : Color
	Brightness : number
	LightSize : number
	Specular : number
	Shadows : boolean
end

declare class SunLight extends Light
end

declare class PointLight extends Light
	Range : number
end
declare PointLight: {
New: (NetworkedObject?) -> (PointLight),
}


declare class SpotLight extends Light
	Range : number
	Angle : number
end
declare SpotLight: {
New: (NetworkedObject?) -> (SpotLight),
}


declare class Sound extends Dynamic
	Audio : AudioAsset
	Volume : number
	Pitch : number
	Pan : number
	Autoplay : boolean
	Loop : boolean
	LoopStart : number
	PlayInWorld : boolean
	Paused : boolean
	MaxDistance : number
	AttenuationMode : SoundAttenuationMode
	Time : number
	Playing : boolean
	Loading : boolean
	Length : number
	Loaded : PTSignal
	Finished : PTSignal
	function Play(self): nil
	function PlayOneShot(self, volume: number?): nil
	function Pause(self): nil
	function Stop(self): nil
	function GetPeakVolume(self): number
end
declare Sound: {
New: (NetworkedObject?) -> (Sound),
}


declare class Accessory extends Dynamic
	TargetAttachment : CharacterAttachment
end
declare Accessory: {
New: (NetworkedObject?) -> (Accessory),
}


declare class VoiceBox extends Dynamic
	function Speak(self, msg: string): nil
end
declare VoiceBox: {
New: (NetworkedObject?) -> (VoiceBox),
}


declare class Decal extends Dynamic
	Image : ImageAsset
	Energy : number
	Color : Color
end
declare Decal: {
New: (NetworkedObject?) -> (Decal),
}


declare class Explosion extends Dynamic
	Radius : number
	Force : number
	AffectAnchored : boolean
	Damage : number
	AffectWelds : boolean
	UseEffects : boolean
	AffectPredicate : () -> ()
	Touched : PTSignal<Instance>
end
declare Explosion: {
New: (NetworkedObject?) -> (Explosion),
}


declare class GUI3D extends Dynamic
	Shaded : boolean
	FaceCamera : boolean
	Transparent : boolean
	AbsoluteSize : Vector2
end
declare GUI3D: {
New: (NetworkedObject?) -> (GUI3D),
}


declare class Image3D extends Dynamic
	Image : ImageAsset
	TextureScale : Vector2
	TextureOffset : Vector2
	Color : Color
	CastShadows : boolean
	Shaded : boolean
	FaceCamera : boolean
	DoubleSided : boolean
	TextureFilter : TextureFilter
end
declare Image3D: {
New: (NetworkedObject?) -> (Image3D),
}


declare class Marker3D extends Dynamic
	Length : number
	AppearOnTop : boolean
	VisibleInDev : boolean
end
declare Marker3D: {
New: (NetworkedObject?) -> (Marker3D),
}


declare class Model extends Dynamic
end
declare Model: {
New: (NetworkedObject?) -> (Model),
}


declare class Particles extends Dynamic
	Playing : boolean
	SpeedScale : number
	Image : ImageAsset
	TextureFilter : TextureFilter
	Color : ColorSeries
	Lifetime : NumberRange
	Amount : number
	Explosiveness : number
	Gravity : Vector3
	VelocityDirection : Vector3
	InitialVelocity : NumberRange
	StartRotation : NumberRange
	AngularVelocity : NumberRange
	AngularVelocityOverLifetime : NumberSeries
	LinearAcceleration : NumberRange
	LinearAccelerationOverLifetime : NumberSeries
	RadialAcceleration : NumberRange
	RadialAccelerationOverLifetime : NumberSeries
	TangentialAcceleration : NumberRange
	TangentialAccelerationOverLifetime : NumberSeries
	OrbitalVelocity : NumberRange
	OrbitalVelocityOverLifetime : NumberSeries
	Damping : NumberRange
	DampingOverLifetime : NumberSeries
	ScaleOverVelocity : NumberRange
	ScaleOverVelocityCurve : NumberSeries
	TurbulenceEnabled : boolean
	TurbulenceInfluence : NumberRange
	TurbulenceOverLifetime : NumberSeries
	TurbulenceNoiseScale : number
	TurbulenceNoiseStrength : number
	TurbulenceNoiseSpeed : Vector3
	Spread : number
	Flatness : number
	Scale : NumberRange
	ScaleOverLifetime : NumberSeries
	HueVariation : NumberRange
	BlendMode : BlendMode
	Shaded : boolean
	EmissionShape : ParticleEmissionShape
	EmissionShapeScale : Vector3
	SimulationSpace : ParticleSimulationSpace
	Orientation : ParticleOrientation
	IsPlaying : boolean
	IsPaused : boolean
	IsStopped : boolean
	function Play(self): nil
	function Pause(self): nil
	function Stop(self): nil
	function Clear(self): nil
	function Emit(self, count: number): nil
end
declare Particles: {
New: (NetworkedObject?) -> (Particles),
}


declare class Text3D extends Dynamic
	Text : string
	FontSize : number
	Color : Color
	OutlineWidth : number
	OutlineColor : Color
	FaceCamera : boolean
	HorizontalAlignment : HorizontalAlignment
	VerticalAlignment : VerticalAlignment
	FontAsset : FontAsset
	UseRichText : boolean
	Shaded : boolean
end
declare Text3D: {
New: (NetworkedObject?) -> (Text3D),
}


declare class Animator extends Instance
	CurrentAnimation : string
	function PlayAnimation(self, animationKey: string): nil
	function PlayOneShotAnimation(self, animationKey: string): nil
	function StopAnimation(self): nil
	function StopOneShotAnimation(self): nil
end
declare Animator: {
New: (NetworkedObject?) -> (Animator),
}


declare class Environment extends Instance
	CurrentCamera : Camera
	Gravity : Vector3
	PartDestroyHeight : number
	AutoGenerateNavMesh : boolean
	function Raycast(self, origin: Vector3, direction: Vector3, maxDistance: number?, ignoreList: { Instance }?, passthroughMask: number?): RayResult
	function RaycastAll(self, origin: Vector3, direction: Vector3, maxDistance: number?, ignoreList: { Instance }?): { RayResult }
	function RaycastGather(self, origin: Vector3, direction: Vector3, maxDistance: number?, ignoreList: { Instance }?, passthroughMask: number?): { RayResult }
	function OverlapSphere(self, origin: Vector3, radius: number, ignoreList: { Instance }?): { Instance }
	function OverlapBox(self, pos: Vector3, size: Vector3, rot: Vector3, ignoreList: { Instance }?): { Instance }
	function RebuildNavMesh(self): nil
	function GetPointOnNavMesh(self, toPoint: Vector3): Vector3
end

declare class Lighting extends Instance
	Skybox : SkyboxPreset
	AmbientSource : AmbientSource
	AmbientColor : Color
	FogEnabled : boolean
	FogColor : Color
	FogStartDistance : number
	FogEndDistance : number
end

declare class Sky extends Instance
end

declare class GradientSky extends Sky
	SunDiscColor : Color
	SunDiscMultiplier : number
	SunDiscExponent : number
	SunHaloColor : Color
	SunHaloExponent : number
	SunHaloContribution : number
	HorizonLineColor : Color
	HorizonLineExponent : number
	HorizonLineContribution : number
	SkyGradientTop : Color
	SkyGradientBottom : Color
	SkyGradientExponent : number
end
declare GradientSky: {
New: (NetworkedObject?) -> (GradientSky),
}


declare class ImageSky extends Sky
	TopImage : ImageAsset
	BottomImage : ImageAsset
	LeftImage : ImageAsset
	RightImage : ImageAsset
	FrontImage : ImageAsset
	BackImage : ImageAsset
	TextureFilter : TextureFilter
end
declare ImageSky: {
New: (NetworkedObject?) -> (ImageSky),
}


declare class ProceduralSky extends Sky
	SunSize : number
	SkyTint : Color
	HorizonColor : Color
	GroundColor : Color
	Exposure : number
end
declare ProceduralSky: {
New: (NetworkedObject?) -> (ProceduralSky),
}


declare class Team extends Instance
	DisplayName : string
	Color : Color
	function GetDisplayName(self): string
	function GetPlayers(self): { Player }
end
declare Team: {
New: (NetworkedObject?) -> (Team),
}


declare class Stat extends Instance
	DisplayName : string
	Visible : boolean
	function GetDisplayName(self): string
	function Set(self, player: Player, val: number): nil
	function Set(self, player: Player, val: string): nil
	function Get(self, player: Player): any
	function GetTotalForTeam(self, team: Team): number
	function GetDisplayValue(self, plr: Player): string
end
declare Stat: {
New: (NetworkedObject?) -> (Stat),
}


declare class HiddenBase extends Instance
end

declare class Inventory extends HiddenBase
end

declare class PlayerDefaults extends HiddenBase
	MaxHealth : number
	WalkSpeed : number
	SprintSpeed : number
	JumpPower : number
	RespawnTime : number
	ChatColor : Color
	ChatColorsEnabled : boolean
	CanMove : boolean
	StaminaBurn : number
	UseStamina : boolean
	StaminaEnabled : boolean
	Stamina : number
	MaxStamina : number
	StaminaRegen : number
	KeepInventory : boolean
	UseHeadTurning : boolean
	UseBubbleChat : boolean
	AutoLoadAppearance : boolean
	LoadAppearanceTools : boolean
	MovementMode : PlayerMovementMode
	function LoadDefaults(self): nil
end

declare class Hidden extends HiddenBase
end

declare class ServerHidden extends HiddenBase
end

declare class Temporary extends ServerHidden
end

declare class UIField extends Instance
	PositionOffset : Vector2
	PositionRelative : Vector2
	Rotation : number
	SizeOffset : Vector2
	SizeRelative : Vector2
	ClipDescendants : boolean
	PivotPoint : Vector2
	Scale : Vector2
	Visible : boolean
	MaskMode : UIMaskMode
	IgnoreMouse : boolean
	ZIndex : number
	AbsolutePosition : Vector2
	AbsoluteSize : Vector2
	IsVisibleInTree : boolean
	MouseEnter : PTSignal
	MouseExit : PTSignal
	MouseDown : PTSignal
	MouseUp : PTSignal
	TransformChanged : PTSignal
	VisibilityChanged : PTSignal
end
declare UIField: {
New: (NetworkedObject?) -> (UIField),
}


declare class UIView extends UIField
	BorderColor : Color
	Color : Color
	BorderMode : BorderMode
	BorderWidth : number
	CornerRadius : number
end
declare UIView: {
New: (NetworkedObject?) -> (UIView),
}


declare class UILabel extends UIView
	Text : string
	TextColor : Color
	OutlineWidth : number
	OutlineColor : Color
	HorizontalAlignment : HorizontalAlignment
	VerticalAlignment : VerticalAlignment
	FontSize : number
	AutoSize : boolean
	MaxAutoSize : number
	UseRichText : boolean
	FontAsset : FontAsset
	TextTrimming : TextTrimming
	TextWrapped : boolean
end
declare UILabel: {
New: (NetworkedObject?) -> (UILabel),
}


declare class UIButton extends UILabel
	Clicked : PTSignal
end
declare UIButton: {
New: (NetworkedObject?) -> (UIButton),
}


declare class UITextInput extends UIView
	Text : string
	TextColor : Color
	JustifyText : HorizontalAlignment
	FontSize : number
	AutoSize : boolean
	MaxAutoSize : number
	MultiLine : boolean
	Placeholder : string
	PlaceholderColor : Color
	ReadOnlyColor : Color
	ReadOnly : boolean
	FontAsset : FontAsset
	Submitted : PTSignal<string>
	Changed : PTSignal<string>
	FocusEnter : PTSignal
	FocusExit : PTSignal
	function Focus(self): nil
end
declare UITextInput: {
New: (NetworkedObject?) -> (UITextInput),
}


declare class UIContainer extends UIField
end

declare class UIHVLayout extends UIContainer
	Spacing : number
	ChildAlignment : UILayoutAlignment
end

declare class UIFlowLayout extends UIHVLayout
end

declare class UIHFlow extends UIFlowLayout
end
declare UIHFlow: {
New: (NetworkedObject?) -> (UIHFlow),
}


declare class UIVFlow extends UIFlowLayout
end
declare UIVFlow: {
New: (NetworkedObject?) -> (UIVFlow),
}


declare class UIHLayout extends UIHVLayout
end
declare UIHLayout: {
New: (NetworkedObject?) -> (UIHLayout),
}


declare class UIVLayout extends UIHVLayout
end
declare UIVLayout: {
New: (NetworkedObject?) -> (UIVLayout),
}


declare class UIGridLayout extends UIContainer
	Spacing : number
	Columns : number
end
declare UIGridLayout: {
New: (NetworkedObject?) -> (UIGridLayout),
}


declare class UIScrollView extends UIContainer
	HorizontalScrollMode : UIScrollMode
	VerticalScrollMode : UIScrollMode
end
declare UIScrollView: {
New: (NetworkedObject?) -> (UIScrollView),
}


declare class UIImage extends UIField
	Image : ImageAsset
	TextureScale : Vector2
	TextureOffset : Vector2
	Color : Color
	StretchMode : ImageStretchMode
	TextureFilter : TextureFilter
	FlipHorizontal : boolean
	FlipVertical : boolean
	Loading : boolean
end
declare UIImage: {
New: (NetworkedObject?) -> (UIImage),
}


declare class UIViewport extends UIField
end
declare UIViewport: {
New: (NetworkedObject?) -> (UIViewport),
}


declare class Players extends Instance
	LocalPlayer : Player
	PlayerCollisionEnabled : boolean
	UseServerAuthority : boolean
	PlayersCount : number
	PlayerAdded : PTSignal<Player>
	PlayerRemoved : PTSignal<Player>
	function GetPlayers(self): { Player }
	function GetPlayer(self, username: string): Player
	function GetPlayerByID(self, userID: number): Player
end

declare class PlayerGUI extends Instance
end

declare class Stats extends Instance
	function GetStats(self): { Stat }
	function GetVisibleStats(self): { Stat }
end

declare class Teams extends Instance
	function GetTeams(self): { Team }
end

declare class GUI extends Instance
	Visible : boolean
	ZIndex : number
	AvoidCoreUI : boolean
end
declare GUI: {
New: (NetworkedObject?) -> (GUI),
}


declare class Clothing extends Instance
	Image : ImageAsset
end
declare Clothing: {
New: (NetworkedObject?) -> (Clothing),
}


declare class BindableEvent extends Instance
	Invoked : PTSignal
	function Invoke(self, par: any): nil
end
declare BindableEvent: {
New: (NetworkedObject?) -> (BindableEvent),
}


declare class BodyPosition extends Instance
	TargetPosition : Vector3
	Force : number
	AcceptanceDistance : number
end
declare BodyPosition: {
New: (NetworkedObject?) -> (BodyPosition),
}


declare class BodyRotation extends Instance
	TargetRotation : Vector3
	Force : number
	AcceptanceAngle : number
	function SetQuaternion(self, quaternion: Quaternion): nil
end
declare BodyRotation: {
New: (NetworkedObject?) -> (BodyRotation),
}


declare class ValueBase extends Instance
	Changed : PTSignal
end

declare class BoolValue extends ValueBase
	Value : boolean
end
declare BoolValue: {
New: (NetworkedObject?) -> (BoolValue),
}


declare class ColorValue extends ValueBase
	Value : Color
end
declare ColorValue: {
New: (NetworkedObject?) -> (ColorValue),
}


declare class InstanceValue extends ValueBase
	Value : Instance
end
declare InstanceValue: {
New: (NetworkedObject?) -> (InstanceValue),
}


declare class IntValue extends ValueBase
	Value : number
end
declare IntValue: {
New: (NetworkedObject?) -> (IntValue),
}


declare class NumberValue extends ValueBase
	Value : number
end
declare NumberValue: {
New: (NetworkedObject?) -> (NumberValue),
}


declare class QuaternionValue extends ValueBase
	Value : Quaternion
end
declare QuaternionValue: {
New: (NetworkedObject?) -> (QuaternionValue),
}


declare class RangeValue extends ValueBase
	Value : NumberRange
end
declare RangeValue: {
New: (NetworkedObject?) -> (RangeValue),
}


declare class StringValue extends ValueBase
	Value : string
end
declare StringValue: {
New: (NetworkedObject?) -> (StringValue),
}


declare class VariantValue extends ValueBase
	Value : Variant
end
declare VariantValue: {
New: (NetworkedObject?) -> (VariantValue),
}


declare class Vector2Value extends ValueBase
	Value : Vector2
end
declare Vector2Value: {
New: (NetworkedObject?) -> (Vector2Value),
}


declare class Vector3Value extends ValueBase
	Value : Vector3
end
declare Vector3Value: {
New: (NetworkedObject?) -> (Vector3Value),
}


declare class LightingModifier extends Instance
end

declare class ColorAdjustModifier extends LightingModifier
	Brightness : number
	Contrast : number
	Saturation : number
	TintColor : Color
end
declare ColorAdjustModifier: {
New: (NetworkedObject?) -> (ColorAdjustModifier),
}


declare class Folder extends Instance
end
declare Folder: {
New: (NetworkedObject?) -> (Folder),
}


declare class Grabbable extends Instance
	Force : number
	MaxRange : number
	MaxGrabbableRange : number
	UseDragForce : boolean
	PermissionMode : GrabbablePermissionMode
	Dragger : Player
	PermissionPredicate : () -> ()
	Grabbed : PTSignal<Player>
	Released : PTSignal<Player>
end
declare Grabbable: {
New: (NetworkedObject?) -> (Grabbable),
}


declare class MissingInstance extends Instance
end

declare class NetworkEvent extends Instance
	Reliable : boolean
	InvokedServer : PTSignal<Player, NetMessage>
	InvokedClient : PTSignal<NetMessage>
	function InvokeServer(self, msg: NetMessage?, _: any?): nil
	function InvokeClient(self, msg: NetMessage?, player: Player?): nil
	function InvokeClients(self, msg: NetMessage?): nil
end
declare NetworkEvent: {
New: (NetworkedObject?) -> (NetworkEvent),
}


declare class UIAspectRatioRestraint extends Instance
	DominantAxis : DominantAxis
	ScaleType : AspectRatioScaleType
	AspectRatio : number
end
declare UIAspectRatioRestraint: {
New: (NetworkedObject?) -> (UIAspectRatioRestraint),
}


declare class UICorner extends Instance
	CornerRadius : UIScale
	TopLeftRadius : UIScale
	TopRightRadius : UIScale
	BottomLeftRadius : UIScale
	BottomRightRadius : UIScale
end
declare UICorner: {
New: (NetworkedObject?) -> (UICorner),
}


declare class UIShadow extends Instance
	Layers : { ShadowLayer }
end
declare UIShadow: {
New: (NetworkedObject?) -> (UIShadow),
}


declare class UIStroke extends Instance
	Thickness : UIScale
	Color : Color
end
declare UIStroke: {
New: (NetworkedObject?) -> (UIStroke),
}


declare class Weld extends Instance
	Part0 : Instance
	Part1 : Instance
	Enabled : boolean
	function Break(self): nil
end
declare Weld: {
New: (NetworkedObject?) -> (Weld),
}


declare class InputService extends Instance
	IsWindowFocused : boolean
	IsTouchscreen : boolean
	IsGameFocused : boolean
	IsInputFocused : boolean
	IsGamepadConnected : boolean
	IsMenuOpened : boolean
	CursorLocked : boolean
	CursorVisible : boolean
	MouseDelta : Vector2
	MousePosition : Vector2
	ScreenWidth : number
	ScreenHeight : number
	MouseMoved : PTSignal<Vector2>
	GameFocused : PTSignal
	GameUnfocused : PTSignal
	GamepadConnected : PTSignal
	GamepadDisconnected : PTSignal
	KeyDown : PTSignal<KeyCode, boolean>
	KeyUp : PTSignal<KeyCode, boolean>
	AxisValueChanged : PTSignal<KeyCode, number>
	function StartGamepadVibration(self, weakMagnitude: number, strongMagnitude: number, duration: number): nil
	function StopGamepadVibration(self): nil
	function GetMouseWorldPosition(self, ignoreList: { Instance }?, passthroughMask: number?): Vector3
	function GetVector2(self, actionName: string): InputActionVector2
	function GetButton(self, actionName: string): InputActionButton
	function GetAxis(self, actionName: string): InputActionAxis
	function BindButton(self, name: string): InputActionButton
	function BindAxis(self, name: string): InputActionAxis
	function BindVector2(self, name: string): InputActionVector2
end

declare class ScriptService extends Instance
end

declare class ChatService extends Instance
	ChatPredicate : () -> ()
	NewChatMessage : PTSignal<Player, string>
	MessageReceived : PTSignal<string>
	MessageDeclined : PTSignal
	function BroadcastMessage(self, msg: string): nil
	function UnicastMessage(self, msg: string, plr: Player): nil
end

declare class FilterService extends Instance
end
declare FilterService: {
Filter: (string) -> (string),
}


declare class AssetsService extends Instance
	function GetFileLinkByPath(self, path: string): FileLinkAsset
	function GetFileLinkByID(self, id: string): FileLinkAsset
end

declare class AchievementsService extends Instance
	UseAchievementSound : boolean
	NotifyAchievements : boolean
	GotAchievement : PTSignal<number>
	function Award(self, userID: number, achievementID: number, callback: () -> ()): nil
	function AwardAsync(self, userID: number, achievementID: number): nil
	function HasAchievement(self, userID: number, achievementID: number, callback: () -> ()): nil
	function HasAchievementAsync(self, userID: number, achievementID: number): boolean
end

declare class CoreUIService extends Instance
	CtrlLockCursor : CtrlLockCursor
	ChatBubbleRenderDistance : number
	UseUserCard : boolean
	UseChat : boolean
	UseHealthBar : boolean
	UseLeaderboard : boolean
	UseHotbar : boolean
	UseBackpack : boolean
	UseMenuButton : boolean
	UseEmoteWheel : boolean
	CanRespawn : boolean
end
declare CoreUIService: {
	TopInset : number,
}


declare class CaptureService extends Instance
	OnCooldown : boolean
	CanCapture : boolean
	DefaultCaptureOverlay : UIField
	SpectatorAttach : Dynamic
	function TakePhotoAtDynamic(self, dyn: Dynamic, photoSize: Vector2?, overlay: UIField?): nil
	function TakePhotoAt(self, pos: Vector3, rot: Vector3, photoSize: Vector2?, overlay: UIField?): nil
end

declare class DatastoreService extends Instance
	function GetDatastore(self, key: string): Datastore
end

declare class HttpService extends Instance
	function RequestAsync(self, data: HttpRequestData): HttpResponseData
	function GetAsync(self, url: string, headers: { any }?): string
	function PostAsync(self, url: string, body: string, headers: { any }?): string
	function PutAsync(self, url: string, body: string, headers: { any }?): string
	function DeleteAsync(self, url: string, body: string, headers: { any }?): string
	function PatchAsync(self, url: string, body: string, headers: { any }?): string
	function GetBufferAsync(self, url: string, headers: { any }?): buffer
	function PostBufferAsync(self, url: string, body: string, headers: { any }?): buffer
	function PutBufferAsync(self, url: string, body: string, headers: { any }?): buffer
	function DeleteBufferAsync(self, url: string, body: string, headers: { any }?): buffer
	function PatchBufferAsync(self, url: string, body: string, headers: { any }?): buffer
end

declare class InsertService extends Instance
	function DefaultNPC(self): NPC
	function InitializeDefaultNPC(self, npc: NPC): nil
	function DefaultCharacter(self): PolytorianModel
	function ModelAsync(self, id: number): Instance
	function ClothingAsync(self, id: number): Clothing
	function AccessoryAsync(self, id: number): Accessory
	function ToolAsync(self, id: number): Tool
end

declare class PurchasesService extends Instance
	function PromptAsync(self, player: Player, assetID: number): boolean
	function OwnsItemAsync(self, player: Player, assetID: number): boolean
end

declare class TweenService extends Instance
	function NewTween(self): TweenObject
end

declare class PresenceService extends Instance
	State : string
	CoverImage : PTImageAsset
	function ResetTimer(self): nil
end

declare class PreferencesService extends Instance
	CameraSensitivity : number
	UiScale : number
	SettingChanged : PTSignal<string, any>
	function Get(self, name: string): any
end

declare class IOService extends Instance
	function ReadBytesFromPath(self, path: string): buffer
	function ReadTextFromPath(self, path: string): string
	function WriteBytesToPath(self, path: string, bytes: buffer): nil
	function WriteTextToPath(self, path: string, txt: string): nil
	function ListProjectFiles(self): { string }
	function ReadBytesFromID(self, id: string): buffer
	function GetPathFromID(self, indexID: string): string
end

declare class WorldsService extends Instance
	function NewServerAsync(self, worldPath: string): string
	function NewServerAsync(self, data: NewServerRequestData): string
	function JoinWorldAsync(self, plr: Player, to: string): nil
	function JoinWorldPartyAsync(self, plrs: { Player }, to: string): nil
	function JoinPrivateAsync(self, plr: Player, accessID: string): nil
	function JoinPrivatePartyAsync(self, players: { Player }, accessID: string): nil
end

declare class SocialService extends Instance
end

declare class HookService extends Instance
	Updated : PTSignal<number>
	PreRendered : PTSignal<number>
	PostRendered : PTSignal<number>
	PhysicsUpdated : PTSignal<number>
end

declare class CreatorHistory extends Instance
	function NewAction(self, title: string): nil
	function AddDoCallback(self, callback: () -> ()): nil
	function AddUndoCallback(self, callback: () -> ()): nil
	function CommitAction(self): nil
end

declare class CreatorContextService extends Instance
end

declare class CreatorSelections extends Instance
	Selected : PTSignal<Instance>
	Deselected : PTSignal<Instance>
	function Select(self, instance: Instance): nil
	function SelectChild(self, instance: Instance): nil
	function GetSelected(self): { Instance }
	function Deselect(self, instance: Instance): nil
	function SelectOnly(self, instance: Instance): nil
	function DeselectAll(self): nil
	function HasSelected(self, instance: Instance): boolean
end

declare class CreatorAddons extends Instance
	function Register(self, identifier: string): AddonObject
end

declare class CreatorGUI extends Instance
end

declare class BaseAsset extends NetworkedObject
end

declare class FileLinkAsset extends BaseAsset
	LinkedID : string
end
declare FileLinkAsset: {
New: (NetworkedObject?) -> (FileLinkAsset),
}


declare class ResourceAsset extends BaseAsset
	Loading : boolean
	Loaded : PTSignal
end

declare class ImageAsset extends ResourceAsset
end

declare class PTImageAsset extends ImageAsset
	ImageID : number
	ImageType : ImageType
end
declare PTImageAsset: {
New: (NetworkedObject?) -> (PTImageAsset),
}


declare class GradientImageAsset extends ImageAsset
	Series : ColorSeries
	Width : number
	Height : number
	Fill : GradientImageFill
	FillFrom : Vector2
	FillTo : Vector2
end
declare GradientImageAsset: {
New: (NetworkedObject?) -> (GradientImageAsset),
}


declare class MeshAnimationAsset extends ResourceAsset
	AnimationType : MeshAnimationType
end

declare class PTMeshAnimationAsset extends MeshAnimationAsset
	AssetID : number
end
declare PTMeshAnimationAsset: {
New: (NetworkedObject?) -> (PTMeshAnimationAsset),
}


declare class AudioAsset extends ResourceAsset
end

declare class PTAudioAsset extends AudioAsset
	AudioID : number
end
declare PTAudioAsset: {
New: (NetworkedObject?) -> (PTAudioAsset),
}


declare class BuiltInAudioAsset extends AudioAsset
	AudioPreset : BuiltInAudioPreset
end
declare BuiltInAudioAsset: {
New: (NetworkedObject?) -> (BuiltInAudioAsset),
}


declare class MeshAsset extends ResourceAsset
end

declare class PTMeshAsset extends MeshAsset
	AssetID : number
end
declare PTMeshAsset: {
New: (NetworkedObject?) -> (PTMeshAsset),
}


declare class FontAsset extends ResourceAsset
end

declare class BuiltInFontAsset extends FontAsset
	FontPreset : FontPreset
	FontWeight : FontWeight
	FontStyle : FontStyle
end
declare BuiltInFontAsset: {
New: (NetworkedObject?) -> (BuiltInFontAsset),
}


declare class RayResult
	Origin : Vector3
	Direction : Vector3
	Position : Vector3
	Normal : Vector3
	Distance : number
	Instance : Instance
end

declare class MeshAnimationInfo
	Name : string
	Length : number
	IsPlaying : boolean
end

declare class TweenObject
	Looped : boolean
	Parallel : boolean
	SpeedScale : number
	Direction : TweenDirection
	Transition : TweenTransition
	IsRunning : boolean
	ElapsedTime : number
	Finished : PTSignal
	Canceled : PTSignal
	function SetDirection(self, dir: TweenDirection): TweenObject
	function SetTrans(self, trans: TweenTransition): TweenObject
	function TweenPosition(self, target: Dynamic, destination: Vector3, time: number): TweenObject
	function TweenRotation(self, target: Dynamic, destination: Vector3, time: number): TweenObject
	function TweenSize(self, target: Dynamic, destination: Vector3, time: number): TweenObject
	function TweenColor(self, from: Color, to: Color, time: number, callback: () -> ()): TweenObject
	function TweenNumber(self, from: number, to: number, time: number, callback: () -> ()): TweenObject
	function TweenVector2(self, from: Vector2, to: Vector2, time: number, callback: () -> ()): TweenObject
	function TweenVector3(self, from: Vector3, to: Vector3, time: number, callback: () -> ()): TweenObject
	function TweenQuaternion(self, from: Quaternion, to: Quaternion, time: number, callback: () -> ()): TweenObject
	function Play(self): nil
	function Pause(self): nil
	function Stop(self): nil
	function Interval(self, sec: number): TweenObject
	function Chain(self): TweenObject
	function Cancel(self, callFinished: boolean?): nil
end

declare class AddonObject
	Identifier : string
	AddonName : string
	AddonIcon : PTImageAsset
	CleanupReceived : PTSignal
	function CreateToolItem(self, txt: string): AddonToolItem
end
declare AddonObject: {
RequestPermissions: ({ AddonPermission }) -> (nil),
}


declare class AddonToolItem
	Pressed : PTSignal
end

declare class CreatorService
	LocalTestActive : boolean
	LocalTestStarted : PTSignal
	LocalTestStopped : PTSignal
end
declare CreatorService: {
	Interface : CreatorInterface,
	CurrentGame : World,
}


declare class InputAction
end

declare class InputActionVector2 extends InputAction
	Up : InputButtonCollection
	Down : InputButtonCollection
	Left : InputButtonCollection
	Right : InputButtonCollection
	Value : Vector2
end

declare class InputActionButton extends InputAction
	Buttons : InputButtonCollection
	IsPressed : boolean
	Weight : number
	Pressed : PTSignal
	Released : PTSignal
end

declare class InputActionAxis extends InputAction
	Negative : InputButtonCollection
	Positive : InputButtonCollection
	Value : number
end

declare class InputButtonCollection
	function AddButton(self, btn: InputButton): nil
	function RemoveButton(self, btn: InputButton): nil
	function GetButtons(self): { InputButton }
end

declare class InputButton
	KeyCode : KeyCode
	function __eq(self, a: InputButton, b: InputButton): boolean
end
declare InputButton: {
New: () -> (InputButton),
New: (KeyCode) -> (InputButton),
}


declare class Datastore
	Key : string
	function GetAsync(self, key: string): any
	function SetAsync(self, key: string, value: any): nil
	function RemoveAsync(self, key: string): nil
	function Get(self, key: string, callback: () -> ()): nil
	function Set(self, key: string, value: any, callback: () -> ()): nil
	function Remove(self, key: string, callback: () -> ()): nil
	function Disconnect(self): nil
end

declare class HttpResponseData
	Success : boolean
	StatusCode : number
	Headers : { any }
	Body : string
	Buffer : buffer
end

declare class HttpRequestData
	URL : string
	Method : HttpRequestMethod
	Body : string
	Headers : { any }
end
declare HttpRequestData: {
New: () -> (HttpRequestData),
}


declare class NewServerRequestData
	WorldPath : string
	MaxPlayers : number
end
declare NewServerRequestData: {
New: () -> (NewServerRequestData),
}


declare class ColorSeries
	PointCount : number
	function Clear(self): nil
	function SetColor(self, point: number, color: Color): nil
	function RemovePoint(self, point: number): nil
	function GetOffsets(self): { number }
	function GetColors(self): { Color }
	function SetOffset(self, point: number, offset: number): nil
	function GetColor(self, point: number): Color
	function GetOffset(self, point: number): number
	function AddPoint(self, offset: number, color: Color): number
	function Lerp(self, t: number): Color
end
declare ColorSeries: {
New: () -> (ColorSeries),
New: (Color, Color) -> (ColorSeries),
}


declare class NumberSeries
	PointCount : number
	function Clear(self): nil
	function SetValue(self, point: number, value: number): nil
	function RemovePoint(self, point: number): nil
	function GetOffsets(self): { number }
	function GetValues(self): { number }
	function SetOffset(self, point: number, offset: number): nil
	function GetValue(self, point: number): number
	function GetOffset(self, point: number): number
	function AddPoint(self, offset: number, value: number): number
	function Lerp(self, t: number): number
end
declare NumberSeries: {
New: () -> (NumberSeries),
New: (number, number) -> (NumberSeries),
}


declare class NumberRange
	Min : number
	Max : number
	function Lerp(self, t: number): number
end
declare NumberRange: {
New: (number, number) -> (NumberRange),
}


declare class UIScale
	Offset : number
	Scale : number
	function Compute(self, parentSize: number): number
end

declare class ShadowLayer
	Color : Color
	Offset : Vector2
	Radius : number
	Spread : number
	BlendMode : BlendMode
end
declare ShadowLayer: {
New: () -> (ShadowLayer),
}


declare class NetMessage
	function AddString(self, key: string, value: string): nil
	function AddInt(self, key: string, value: number): nil
	function AddBool(self, key: string, value: boolean): nil
	function AddNumber(self, key: string, value: number): nil
	function AddVector2(self, key: string, value: Vector2): nil
	function AddVector3(self, key: string, value: Vector3): nil
	function AddColor(self, key: string, value: Color): nil
	function AddQuaternion(self, key: string, value: Quaternion): nil
	function AddVariant(self, key: string, value: Variant): nil
	function AddInstance(self, key: string, value: Instance): nil
	function AddBuffer(self, key: string, buffer: buffer): nil
	function GetString(self, key: string): string
	function GetInt(self, key: string): number
	function GetNumber(self, key: string): number
	function GetBool(self, key: string): boolean
	function GetVector2(self, key: string): Vector2
	function GetVector3(self, key: string): Vector3
	function GetColor(self, key: string): Color
	function GetQuaternion(self, key: string): Quaternion
	function GetVariant(self, key: string): Variant
	function GetInstance(self, key: string): Instance
	function GetBuffer(self, key: string): buffer
end
declare NetMessage: {
New: () -> (NetMessage),
}


declare class PTCallback
end

declare class PTFunction
end

declare class ScriptSharedTable
	function Clear(self): nil
	function Remove(self, key: string): nil
	function ClearPrefix(self, prefix: string): nil
	function ClearSuffix(self, suffix: string): nil
	function __index(self, index: any): any
	function __newindex(self, index: any, val: any): nil
end

declare class Variant
	Value : any
	function __tostring(self, v: Variant): string
end
declare Variant: {
New: () -> (Variant),
New: (any) -> (Variant),
}


declare class Bounds
	Center : Vector3
	Size : Vector3
	Extents : Vector3
	Start : Vector3
	End : Vector3
	Volume : number
	function __eq(self, a: Bounds, b: Bounds): boolean
	function __tostring(self, v: Bounds): string
	function ClosestPoint(self, point: Vector3): Vector3
	function Contains(self, point: Vector3): boolean
	function Encapsulate(self, point: Vector3): Bounds
	function Expand(self, amount: number): Bounds
	function Intersects(self, other: Bounds): boolean
	function Intersection(self, other: Bounds): Bounds
	function SetMinMax(self, min: Vector3, max: Vector3): Bounds
	function Distance(self, point: Vector3): number
	function SqrDistance(self, point: Vector3): number
end
declare Bounds: {
New: () -> (Bounds),
New: (Vector3, Vector3) -> (Bounds),
ClosestPoint: (Bounds, Vector3) -> (Vector3),
Contains: (Bounds, Vector3) -> (boolean),
Encapsulate: (Bounds, Vector3) -> (Bounds),
Expand: (Bounds, number) -> (Bounds),
Intersects: (Bounds, Bounds) -> (boolean),
Intersection: (Bounds, Bounds) -> (Bounds),
SetMinMax: (Bounds, Vector3, Vector3) -> (Bounds),
Distance: (Bounds, Vector3) -> (number),
SqrDistance: (Bounds, Vector3) -> (number),
}


declare class Vector3
	X : number
	Y : number
	Z : number
	Magnitude : number
	Normalized : Vector3
	SqrMagnitude : number
	function __add(self, a: Vector3, b: Vector3): Vector3
	function __sub(self, a: Vector3, b: Vector3): Vector3
	function __sub(self, a: Vector3, q: Quaternion): Vector3
	function __mul(self, a: Vector3, b: Vector3): Vector3
	function __mul(self, a: Vector3, scalar: number): Vector3
	function __mul(self, scalar: number, b: Vector3): Vector3
	function __mul(self, a: Vector3, q: Quaternion): Vector3
	function __div(self, a: Vector3, b: number): Vector3
	function __mod(self, a: Vector3, b: Vector3): Vector3
	function __unm(self, a: Vector3): Vector3
	function __pow(self, a: Vector3, b: Vector3): Vector3
	function __eq(self, a: Vector3, b: Vector3): boolean
	function __lt(self, a: Vector3, b: Vector3): boolean
	function __le(self, a: Vector3, b: Vector3): boolean
	function __len(self, a: Vector3): number
	function __tostring(self, v: Vector3): string
	function Angle(self, to: Vector3): number
	function Cross(self, rhs: Vector3): Vector3
	function Distance(self, b: Vector3): number
	function Dot(self, rhs: Vector3): number
	function Lerp(self, b: Vector3, t: number): Vector3
	function Max(self, rhs: Vector3): Vector3
	function Min(self, rhs: Vector3): Vector3
	function MoveTowards(self, target: Vector3, maxDistanceDelta: number): Vector3
	function Normalize(self): Vector3
	function Project(self, onNormal: Vector3): Vector3
	function ProjectOnPlane(self, planeNormal: Vector3): Vector3
	function Reflect(self, inNormal: Vector3): Vector3
	function SignedAngle(self, to: Vector3, axis: Vector3): number
	function Slerp(self, b: Vector3, t: number): Vector3
	function Floor(self): Vector3
	function Ceil(self): Vector3
	function Round(self): Vector3
	function Abs(self): Vector3
	function Sign(self): Vector3
	function Rotated(self, axis: Vector3, angle: number): Vector3
	function LimitLength(self, length: number): Vector3
	function Clamp(self, min: Vector3, max: Vector3): Vector3
	function RadToDeg(self): Vector3
	function DegToRad(self): Vector3
end
declare Vector3: {
	Forward : Vector3,
	Back : Vector3,
	Down : Vector3,
	Left : Vector3,
	One : Vector3,
	Zero : Vector3,
	Right : Vector3,
	Up : Vector3,
New: () -> (Vector3),
New: (number) -> (Vector3),
New: (number, number) -> (Vector3),
New: (number, number, number) -> (Vector3),
New: (Vector2) -> (Vector3),
Angle: (Vector3, Vector3) -> (number),
Cross: (Vector3, Vector3) -> (Vector3),
Distance: (Vector3, Vector3) -> (number),
Dot: (Vector3, Vector3) -> (number),
Lerp: (Vector3, Vector3, number) -> (Vector3),
Max: (Vector3, Vector3) -> (Vector3),
Min: (Vector3, Vector3) -> (Vector3),
MoveTowards: (Vector3, Vector3, number) -> (Vector3),
Normalize: (Vector3) -> (Vector3),
Project: (Vector3, Vector3) -> (Vector3),
ProjectOnPlane: (Vector3, Vector3) -> (Vector3),
Reflect: (Vector3, Vector3) -> (Vector3),
SignedAngle: (Vector3, Vector3, Vector3) -> (number),
Slerp: (Vector3, Vector3, number) -> (Vector3),
Floor: (Vector3) -> (Vector3),
Ceil: (Vector3) -> (Vector3),
Round: (Vector3) -> (Vector3),
Abs: (Vector3) -> (Vector3),
Sign: (Vector3) -> (Vector3),
Rotated: (Vector3, Vector3, number) -> (Vector3),
LimitLength: (Vector3, number) -> (Vector3),
Clamp: (Vector3, Vector3, Vector3) -> (Vector3),
RadToDeg: (Vector3) -> (Vector3),
DegToRad: (Vector3) -> (Vector3),
}


declare class Vector2
	X : number
	Y : number
	Magnitude : number
	Normalized : Vector2
	SqrMagnitude : number
	function __add(self, a: Vector2, b: Vector2): Vector2
	function __sub(self, a: Vector2, b: Vector2): Vector2
	function __mul(self, a: Vector2, b: Vector2): Vector2
	function __mul(self, a: Vector2, scalar: number): Vector2
	function __mul(self, scalar: number, b: Vector2): Vector2
	function __div(self, a: Vector2, b: number): Vector2
	function __mod(self, a: Vector2, b: Vector2): Vector2
	function __unm(self, a: Vector2): Vector2
	function __pow(self, a: Vector2, b: Vector2): Vector2
	function __eq(self, a: Vector2, b: Vector2): boolean
	function __lt(self, a: Vector2, b: Vector2): boolean
	function __le(self, a: Vector2, b: Vector2): boolean
	function __len(self, a: Vector2): number
	function __tostring(self, v: Vector2): string
	function Angle(self, to: Vector2): number
	function Cross(self, rhs: Vector2): number
	function Distance(self, b: Vector2): number
	function Dot(self, rhs: Vector2): number
	function Lerp(self, b: Vector2, t: number): Vector2
	function Max(self, rhs: Vector2): Vector2
	function Min(self, rhs: Vector2): Vector2
	function MoveTowards(self, target: Vector2, maxDistanceDelta: number): Vector2
	function Normalize(self): Vector2
	function Project(self, onNormal: Vector2): Vector2
	function Reflect(self, inNormal: Vector2): Vector2
	function Slerp(self, b: Vector2, t: number): Vector2
	function Floor(self): Vector2
	function Ceil(self): Vector2
	function Round(self): Vector2
	function Abs(self): Vector2
	function Sign(self): Vector2
	function Clamp(self, min: Vector2, max: Vector2): Vector2
	function ProjectOnPlane(self, planeNormal: Vector2): Vector2
	function Rotated(self, angle: number): Vector2
	function LimitLength(self, length: number): Vector2
	function RadToDeg(self): Vector2
	function DegToRad(self): Vector2
end
declare Vector2: {
	Down : Vector2,
	Left : Vector2,
	One : Vector2,
	Zero : Vector2,
	Right : Vector2,
	Up : Vector2,
New: () -> (Vector2),
New: (number) -> (Vector2),
New: (number, number) -> (Vector2),
Angle: (Vector2, Vector2) -> (number),
Cross: (Vector2, Vector2) -> (number),
Distance: (Vector2, Vector2) -> (number),
Dot: (Vector2, Vector2) -> (number),
Lerp: (Vector2, Vector2, number) -> (Vector2),
Max: (Vector2, Vector2) -> (Vector2),
Min: (Vector2, Vector2) -> (Vector2),
MoveTowards: (Vector2, Vector2, number) -> (Vector2),
Normalize: (Vector2) -> (Vector2),
Project: (Vector2, Vector2) -> (Vector2),
Reflect: (Vector2, Vector2) -> (Vector2),
Slerp: (Vector2, Vector2, number) -> (Vector2),
Floor: (Vector2) -> (Vector2),
Ceil: (Vector2) -> (Vector2),
Round: (Vector2) -> (Vector2),
Abs: (Vector2) -> (Vector2),
Sign: (Vector2) -> (Vector2),
Clamp: (Vector2, Vector2, Vector2) -> (Vector2),
ProjectOnPlane: (Vector2, Vector2) -> (Vector2),
Rotated: (Vector2, number) -> (Vector2),
LimitLength: (Vector2, number) -> (Vector2),
RadToDeg: (Vector2) -> (Vector2),
DegToRad: (Vector2) -> (Vector2),
}


declare class Quaternion
	X : number
	Y : number
	Z : number
	W : number
	function __add(self, a: Quaternion, b: Quaternion): Quaternion
	function __sub(self, a: Quaternion, b: Quaternion): Quaternion
	function __sub(self, a: Quaternion, v: Vector3): Quaternion
	function __mul(self, a: Quaternion, b: Quaternion): Quaternion
	function __mul(self, a: Quaternion, v: Vector3): Vector3
	function __mul(self, v: Vector3, q: Quaternion): Vector3
	function __eq(self, a: Quaternion, b: Quaternion): boolean
	function __tostring(self, v: Quaternion): string
	function Angle(self, b: Quaternion): number
	function Dot(self, b: Quaternion): number
	function ToEuler(self): Vector3
	function Inverse(self): Quaternion
	function Lerp(self, b: Quaternion, t: number): Quaternion
	function LerpUnclamped(self, b: Quaternion, t: number): Quaternion
	function Normalize(self): Quaternion
	function RotateTowards(self, to: Quaternion, maxDegreesDelta: number): Quaternion
	function Slerp(self, b: Quaternion, t: number): Quaternion
	function SlerpUnclamped(self, b: Quaternion, t: number): Quaternion
end
declare Quaternion: {
	Identity : Quaternion,
New: () -> (Quaternion),
New: (number, number, number, number) -> (Quaternion),
Angle: (Quaternion, Quaternion) -> (number),
AngleAxis: (number, Vector3) -> (Quaternion),
Dot: (Quaternion, Quaternion) -> (number),
Euler: (number, number, number) -> (Quaternion),
Euler: (Vector3) -> (Quaternion),
ToEuler: (Quaternion) -> (Vector3),
FromToRotation: (Vector3, Vector3) -> (Quaternion),
Inverse: (Quaternion) -> (Quaternion),
Lerp: (Quaternion, Quaternion, number) -> (Quaternion),
LerpUnclamped: (Quaternion, Quaternion, number) -> (Quaternion),
LookRotation: (Vector3) -> (Quaternion),
LookRotation: (Vector3, Vector3) -> (Quaternion),
Normalize: (Quaternion) -> (Quaternion),
RotateTowards: (Quaternion, Quaternion, number) -> (Quaternion),
Slerp: (Quaternion, Quaternion, number) -> (Quaternion),
SlerpUnclamped: (Quaternion, Quaternion, number) -> (Quaternion),
}


declare class Color
	R : number
	G : number
	B : number
	A : number
	function __add(self, a: Color, b: Color): Color
	function __sub(self, a: Color, b: Color): Color
	function __mul(self, a: Color, b: any): any
	function __eq(self, a: Color, b: Color): boolean
	function __tostring(self, v: Color): string
	function ToHex(self): string
	function Lerp(self, b: Color, t: number): Color
end
declare Color: {
	Transparent : Color,
	Black : Color,
	Gray : Color,
	White : Color,
	Red : Color,
	Yellow : Color,
	Green : Color,
	Cyan : Color,
	Blue : Color,
	Magenta : Color,
New: () -> (Color),
New: (number) -> (Color),
New: (number, number, number) -> (Color),
New: (number, number, number, number) -> (Color),
Random: () -> (Color),
FromRGB: (number, number, number, number?) -> (Color),
FromHex: (string) -> (Color),
ToHex: (Color) -> (string),
FromHSV: (number, number, number, number?) -> (Color),
Lerp: (Color, Color, number) -> (Color),
}


declare class CreatorInterface
	ToolMode : CreatorToolMode
	TargetPartColor : Color
	TargetPartMaterial : PartMaterial
	MoveSnapEnabled : boolean
	MoveSnapping : number
	UserMoveSnapping : number
	RotateSnapEnabled : boolean
	RotateSnapping : number
	UserRotateSnapping : number
end

